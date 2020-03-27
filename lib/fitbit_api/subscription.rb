module FitbitAPI
  class Client

    ##
    #   GET
    def subscriptions(opts={})
      get("user/-/apiSubscriptions.json", opts)
    end

    ##
    #   POST
    def create_subscription(opts={})
    end

    ##
    #   DELETE
    
  end
end
