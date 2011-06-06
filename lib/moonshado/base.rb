require 'rubygems'
require 'httparty'
require 'active_support'
require 'active_record'
require 'cgi'
require 'digest/md5'

module Moonshado
  class Base
    include HTTParty
    base_uri 'https://api.moonshado.com/'
    
    def self.configure
      { :originating_address => Moonshado::SMS_API_CONFIG[:short_code], :keyword => Moonshado::SMS_API_CONFIG[:keyword] }
    end
    
    def self.client_hash
      Digest::MD5.hexdigest("#{Moonshado::SMS_API_CONFIG[:client_id]}|#{Moonshado::SMS_API_CONFIG[:api_key]}")
    end
    
    def self.deliver(message, options = {})
      qs = { :api_key => Moonshado::SMS_API_CONFIG[:api_key], :message => Base::configure.merge(options).merge(:device_address => message.device_address, :body => message.body, :reporting_key => message.id) }.to_query
      resp = post("/gateway/sms?#{qs}")
      if resp.code.to_i == 200
        return 0
      else
        return resp['status']['code']
      end
    end
  end
end
