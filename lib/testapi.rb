require "testapi/version"
require "httparty"

module Testapi
  class UrlWasNotSetException < ArgumentError; end
  class InvalidDataException < StandardError; end
  class InvalidInputException < StandardError; end

  class Client
    KEYS = [:email, :mobile, :first_name, :last_name, :permission_type, :channel, :company_name]

    def initialize(options)
      @url = options[:url] || raise(UrlWasNotSetException)
    end

    def add(data)
      raise InvalidInputException.new('invalid input') unless KEYS.all? {|s| data.include? s}

      response = HTTParty.post "#{@url}/opt-ins", body: data

      if response.code == 200
        true
      elsif response.code == 400
        raise InvalidDataException.new(response.body)
      else
        false
      end
    end
  end
end
