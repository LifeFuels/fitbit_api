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

    def update_water_log(log_id, ml_amount, opts={})
      opts[:amount] = ml_amount
      opts[:unit] = 'ml'
      post("user/#{user_id}/foods/log/water/#{log_id}.json", opts)
    end

    def update_water_goal(ml_amount, opts={})
      # First determine the water goal unit
      res = self.profile
      return nil if res[:user].nil?
      unit = res[:user][:water_unit_name]
      if unit == 'ml'
        amount = ml_amount
      elsif unit == 'fl oz'
        amount = ml_amount * 0.033814
      else
        return nil
      end
      opts[:target] = amount
      post("user/#{user_id}/foods/log/water/goal.json", opts)
    end

    ##
    # DELETE methods

    # SUCCESS is status = 204
    def delete_water_log(log_id, opts={})
      delete("user/#{user_id}/foods/log/water/#{log_id}.json", opts)
    end
  end
end
