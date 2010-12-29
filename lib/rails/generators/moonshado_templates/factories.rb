Factory.define :message do |message|
  message.to              { "5745551212" }
  message.from            { "12345" }
  message.body            { "Less than 160 characters in total, I shall be."}
end
