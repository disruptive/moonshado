class MoonshadoController < ApplicationController
  
  # carrier
  # device_address
  # message_subid - starting with 0
  # status_code
  # status_info
  # update_date
  # country
  def report
  end

  # carrier
  # device_address (mobile_number)
  # inbound_address (shortcode)
  # country
  # message
  # hash - MD5 hash of "client_id|api_key"
  # timestamp - mm/dd/yyyy hh:mm:ss PST
  def receive
  end
  
end