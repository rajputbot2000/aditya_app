class WithdrawlCreate < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :WithdrawlCreate do
    desc "App Open API"
    # before {api_params}
    params do
      requires :user_id, type: String, allow_blank: false
      requires :rewardId, type: String, allow_blank: false
      requires :payout_Amount, type: String, allow_blank: false
      requires :coin_value, type: String, allow_blank: false
      # requires :securityToken, type: String, allow_blank: false
      # requires :versionName, type: String, allow_blank: false
      # requires :versionCode, type: String, allow_blank: false
    end
    post do
      withdrawldata = []
      @user = User.find(params[:user_id])
      reward= Reward.find(params[:rewardId])
      if @user.present?
        accnt = @user.account.coin_balance
        if accnt.to_i >= params[:payout_Amount].to_i
          wd= Withdrawl.create(
          coins: params[:payout_Amount],
          amount: params[:payout_Amount].to_i/params[:coin_value].to_i,
          transaction_id: SecureRandom.alphanumeric(8),
          reward_id: params[:rewardId].to_i,
          account_id: @user.account.id)
          @user.account.coin_balance=accnt.to_i-params[:payout_Amount].to_i
          @user.account.save!

          withdrawldata << { 
            id: wd.id,
            reward_name: reward.payout_name+" Wallet Transfer", 
            reward_logo: reward.payout_logo , 
            transaction_id: wd.transaction_id,
            coins_reedemed: params[:payout_Amount],
            payout: wd.amount,
            date: wd.created_at,
            account_balance: @user.account.coin_balance
          }
        else
          withdrawldata << {message: "insufficient account balance"}
        end
        {message: 'MSG_SUCCESS', status: 200, withdrawldata: withdrawldata, account_balance: @user.account.coin_balance}
      else
         {message: 'INVALID_USER', status: 500}
      end
          rescue Exception => e
          puts "API Exception-#{Time.now}-WithdrawlCreateAPI-#{params.inspect}-Error-#{e}"
          {message: 'MSG_ERROR', status: 500}
  end
  end
end