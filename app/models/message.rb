# @m = Message.new(:to => '12602498980', :body => "Body of a Message")
class Message < ActiveRecord::Base
  
  validates_length_of :body, :in => 1..160
  validates_format_of :to, :with => /(1\d{10}|\+\d{11,}|\d{5})/
  
  scope :inbound, where(:to => Moonshado::SMS_API_CONFIG[:short_code])
  scope :outbound, where(:from => Moonshado::SMS_API_CONFIG[:short_code])
  scope :read, where('read_at is not null')
  scope :unread, where(:read_at => nil)
  
  def deliver!
    resp = Moonshado::Base.deliver(self)
    if resp == 10
      self.update_attributes(:response_code => 10, :sent_at => DateTime.now)
    else
      self.update_attributes(:response_code => resp)
    end
  end
  
  def inbound?
    to == Moonshado::SMS_API_CONFIG[:short_code]
  end
  
  def outbound?
    from == Moonshado::SMS_API_CONFIG[:short_code]
  end
  
  def read?
    read_at.nil?
  end
  
  def device_address
    inbound? ? from : to
  end
  
  def message_class
    "message #{ read? ? 'unread' : 'read' }"
  end
  
  def response
    Moonshado::RESPONSE_CODES[response_code.to_s]
  end
  
  def status_object
    Moonshado::STATUS_CODES[status_code.to_s]
  end
  
  def status
    status_object.name unless status_object.nil?
  end
  
  def status_detail
    status_object.detail unless status_object.nil?
  end
  
  def get_status
  end
  
end
