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
      post("user/-/apiSubscriptions/#{fs_id}.json", opts)
    end

    def create_subscription(resource, opts={})
      opts[:subscription] = true
      unless SUBSCRIPTION_RESOURCES.include?(resource)
        raise FitbitAPI::InvalidArgumentError, "Invalid resource: \"#{resource}\". Please provide one of the following: #{SUBSCRIPTION_RESOURCES}."
      end
      post("user/-/#{resource}/apiSubscriptions/#{fs_id}.json", opts)
    end


    ##
    #   DELETE

    def delete_subscriptions(opts={})
      opts[:subscription] = true
      delete("user/-/apiSubscriptions/#{fs_id}.json", opts)
    end

  end
end
