module FitbitAPI
  class Client
    def water_logs(date=Date.today, opts={})
      get("user/#{user_id}/foods/log/water/date/#{format_date(date)}.json", opts)
    end

    ##
    # POST Methods
    def log_water(ml_amount, date=Date.today, opts={})
      return nil if ml_amount.nil? || ml_amount.zero?
      opts[:amount] = ml_amount
      opts[:date] = format_date(date)
      opts[:unit] = 'ml'
      post("user/#{user_id}/foods/log/water.json", opts)
    end
  end
end
