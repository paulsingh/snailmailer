require 'forwardable'
require 'rubygems'

gem 'hashie', '~> 0.1.3'
require 'hashie'

gem 'httparty', '~> 0.4.3'
require 'httparty'

module SnailMailer
  class SnailMailerError < StandardError
    attr_reader :data

    def initialize(data)
      @data = data
      super
    end
  end

  class RateLimitExceeded < SnailMailerError; end
  class Unauthorized      < SnailMailerError; end
  class General           < SnailMailerError; end

  class Unavailable   < StandardError; end
  class InformSnailPad < StandardError; end
  class NotFound      < StandardError; end

  #def self.user(id)
  #  response = HTTParty.get("http://twitter.com/users/show/#{id}.json", :format => :json)
  #  Hashie::Mash.new(response)
  #end
end

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'snailmailer', 'request')
require File.join(directory, 'snailmailer', 'base')
