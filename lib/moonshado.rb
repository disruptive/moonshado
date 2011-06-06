require 'moonshado/base'

module Moonshado
  require 'moonshado/engine' if defined?(Rails)
  
  RESPONSE_CODES = {
  	'10' => "Success",
  	'20' => "No message submitted",
  	'21' => "Invalid or no keyword submitted for this originating address",
  	'22' => "Invalid API Key",
  	'24' => "Invalid Shorten Type",
  	'25' => "Invalid Body",
  	'26' => "Invalid TTL",
  	'27' => "Invalid Originating Address",
  	'28' => "Invalid Device Address",
  	'29' => "Devices use invalid carrier(s)",
  	'30' => "Permission denied",
  	'31' => "Invalid request",
  	'99' => "Failure processing request"
  }
  
  STATUS_CODES = {
    '1'  => { :name => "Phase1 Processing", :detail => "Message being processed by Moonshado server" },
    '2'  => { :name => "Internal Switch Error", :detail => "There was an error routing the message with in Moonshado cloud network please resubmit the message." },
    '3'  => { :name => "Sent to Internal Switch", :detail => "Routed with in the Moonshado network" },
    '4'  => { :name => "Processing", :detail => "" },
    '8'  => { :name => "Message sent to Carrier", :detail => "" },
    '9'  => { :name => "Retrying", :detail => "Retrying message due to past failures" },
    '10' => { :name => "Carrier Received", :detail => "Carrier has accepted the message. In some cases, this is the last status." },
    '11' => { :name => "Success", :detail => "" },
    '12' => { :name => "Fail", :detail => "Carrier returned a failure to deliver" },
    '14' => { :name => "Message Queuing Error", :detail => "Failed to transfer request to processor" },
    '15' => { :name => "Retry Failed", :detail => "Unable to retry" },
    '17' => { :name => "Split", :detail => "Message split" },
    '18' => { :name => "Carrier Success", :detail => "Carrier indicated successful delivery" },
    '19' => { :name => "Carrier Reported Error", :detail => "Carrier Error" },
    '21' => { :name => "No answer", :detail => "Carrier returned no answer" },
    '22' => { :name => "Line is Busy", :detail => "Carrier returned line is busy" },
    '23' => { :name => "Carrier SIT", :detail => "Carrier returned sit" },
    '25' => { :name => "Carrier Expired", :detail => "Carrier returned expired" },
    '26' => { :name => "Carrier Deleted", :detail => "Carrier returned deleted" },
    '27' => { :name => "Carrier Undeliverable", :detail => "Carrier returned undeliverable" },
    '28' => { :name => "Carrier Unknown", :detail => "Carrier returned unknown" },
    '29' => { :name => "Carrier Rejected", :detail => "Carrier returned rejected" }
  }
  
end
