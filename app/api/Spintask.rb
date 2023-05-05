class Spintask < Grape::API
  version 'v2', using: :path
  format :json
  prefix :api

  rescue_from :all
  resource :Spintask do
      desc "Spin Task Coin API"
      # before {api_params}

      params do
        requires :user_id, type: String, allow_blank: false
        requires :task_amount, type: String, allow_blank: false
        # requires :securityToken, type: String, allow_blank: false
        # requires :versionName, type: String, allow_blank: false
        # requires :versionCode, type: String, allow_blank: false        
      end

      post do
        begin
          user =User.find(params['user_id']) #valid_user(params['userId'].to_i, params['securityToken'])
          if user.present?
            acc=user.account
            # task_amount = rand(10)              
            p = Point.create(
              logo: 'https://as1.ftcdn.net/v2/jpg/02/99/74/00/1000_F_299740083_8h2iGqpyMKWK7sZm2vG9v8bOCINM3Kg2.jpg', 
              name: 'Daily Lucky Spin',
              coins: params[:task_amount].to_i,
              account_id: acc.id
            )
              acc.coin_balance=act.coin_balance.to_i + params[:task_amount].to_i
              acc.save!
            {message: "MSG_SUCCESS", status: 200, pointhistory: p}
          else
            {message: "INVALID_USER", status: 500} 
          end

        rescue Exception => e
          puts "API Exception-#{Time.now}-Spintask-#{params.inspect}-Error-#{e}"
          { message: MSG_ERROR, status: 500 }
        end
    end
  end  
end