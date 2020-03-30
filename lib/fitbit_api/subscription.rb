module FitbitAPI
  class Client

    SUBSCRIPTION_RESOURCES = %w(activities body foods sleep)

    ##
    #   GET
    def subscriptions(opts={})
      opts[:subscription] = true
      get("user/-/apiSubscriptions.json", opts)
    end

    ##
    #   POST
    def create_all_subscriptions(opts={})
      opts[:subscription] = true
    end

    def create_subscription(resource, opts={})
      opts[:subscription] = true
      unless SUBSCRIPTION_RESOURCES.include?(resource)
        raise FitbitAPI::InvalidArgumentError, "Invalid resource: \"#{resource}\". Please provide one of the following: #{SUBSCRIPTION_RESOURCES}."
      end
    end

    ##
    #   DELETE

  end
end
