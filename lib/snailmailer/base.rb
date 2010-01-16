module Twitter
  class Base
    extend Forwardable

    def_delegators :client, :get, :post, :put, :delete

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def show_all_letters(api_key)
      perform_get("letters.json?api_key=#{@api_key}")
    end
    
    def create_letter(letter)
      perform_post("/letters.json", :body => {:api_key => @api_key, :letter => letter})
    end
    
    def show_letter(id)
      perform_get("/letters/#{id}.json?api_key=#{@api_key}")
    end
    
    def update_letter(id, letter)
      perform_put("/letters/#{id}.json", :body => {:api_key => @api_key, :letter => letter})
    end
    
    def purchase_letter(id)
      perform_get("/letters/#{id}/purchase.json?api_key=#{@api_key}")
    end

    private
      def perform_get(path, options={})
        SnailMailer::Request.get(self, path, options)
      end

      def perform_post(path, options={})
        SnailMailer::Request.post(self, path, options)
      end

      def perform_put(path, options={})
        SnailMailer::Request.put(self, path, options)
      end

      def perform_delete(path, options={})
        SnailMailer::Request.delete(self, path, options)
      end
  end
end
