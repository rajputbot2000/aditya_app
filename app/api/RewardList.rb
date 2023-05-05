class RewardList < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :RewardList do
    desc "App Open API"
    # before {api_params}
    params do
      requires :userId, type: String, allow_blank: false
      # requires :securityToken, type: String, allow_blank: false
      # requires :versionName, type: String, allow_blank: false
      # requires :versionCode, type: String, allow_blank: false
    end
    post do
      Rewards = []
      @user = User.find(params[:userId])
      if @user.present?
        accnt = @user.account.coin_balance
         rewardsdata= Reward.all
          rewardsdata.each do |reward|
            Rewards << {
              id: reward.id, 
              Payout_Name: reward.payout_name, 
              payout_Logo: reward.payout_logo,
              payout_Type: reward.payout_type,
              payout_Amount: reward.payout_amount.split(','),
              Coin_value: reward.coin_value.split(',')
            }
         end
         {message: 'MSG_SUCCESS', status: 200,coin_balance: accnt, Rewards: Rewards}
         else
         {message: 'INVALID_USER', status: 500}
      end
          rescue Exception => e
          puts "API Exception-#{Time.now}-WithdrawPointsAPI-#{params.inspect}-Error-#{e}"
          {message: 'MSG_ERROR', status: 500}
  end
  end
end