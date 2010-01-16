module SnailMailer
  class APIAuth
    include HTTParty
    format :plain
    
    attr_reader :api_key, :options
    
    def initialize(api_key, options={})
      APIAuth.default_params({:api_key => api_key})
      #@api_key = api_key
      @options = options
      options[:api_endpoint] ||= "www.snailpad.com"
      self.class.base_uri "https://#{options[:api_endpoint]}"
    end
    
    def get(uri, headers={})
      self.class.get(uri, :headers => headers)
    end
    
    def post(uri, body={}, headers={})
      self.class.post(uri, :body => body, :headers => headers)
    end
    
    def put(uri, body={}, headers={})
      self.class.put(uri, :body => body, :headers => headers)
    end
    
    def delete(uri, body={}, headers={})
      self.class.delete(uri, :body => body, :headers => headers)
    end

  end
end