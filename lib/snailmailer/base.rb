module SnailMailer
  class Base
    extend Forwardable

    def_delegators :client, :get, :post, :put, :delete

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def show_all_letters
      perform_get("/letters.json")
    end
    
    def create_letter(data)
      perform_post("/letters.json", :body => {:mailing_month => data[:mailing_month], :mailing_day => data[:mailing_day], :mailing_year => data[:mailing_year], :letter => data[:letter]})
    end
    
    def show_letter(id)
      perform_get("/letters/#{id}.json")
    end
    
    def update_letter(id, data)
      perform_put("/letters/#{id}.json", :body => {:mailing_month => data[:mailing_month], :mailing_day => data[:mailing_day], :mailing_year => data[:mailing_year], :letter => data[:letter]})
    end
    
    def purchase_letter(id)
      perform_get("/letters/#{id}/purchase.json")
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
