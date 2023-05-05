class WithdrawlHistory < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :WithdrawlHistory do
    desc "App Open API"
    # before {api_params}
    params do
      requires :userId, type: String, allow_blank: false
      # requires :securityToken, type: String, allow_blank: false
      # requires :versionName, type: String, allow_blank: false
      # requires :versionCode, type: String, allow_blank: false
    end
    post do
        withdrawldata = []
      @user = User.find(params[:userId])
      if @user.present?
        accnt = @user.account
         withdrawlList= Withdrawl.where(account_id: accnt.id)
          withdrawlList.each do |withdraw|
            reward= Reward.find(withdraw.reward_id)
            withdrawldata << {
              id: withdraw.id, 
              payout_name: reward.payout_name,
              payout_Logo: reward.payout_logo,
              payout_type: reward.payout_type,
              coins_reedemed: withdraw.coins, 
              transaction_id: withdraw.transaction_id,
              payout_amount: withdraw.amount,
              date: withdraw.created_at,
            }
         end
         {message: 'MSG_SUCCESS', status: 200, withdrawldata: withdrawldata}
         else
         {message: 'INVALID_USER', status: 500}
      end
          rescue Exception => e
          puts "API Exception-#{Time.now}-WithdrawPointsAPI-#{params.inspect}-Error-#{e}"
          {message: 'MSG_ERROR', status: 500}
  end
  end
end