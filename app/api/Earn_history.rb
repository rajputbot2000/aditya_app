class EarnHistory < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api
  
    rescue_from :all
    resource :EarnHistory do
        desc "Spin Task Coin API"
        # before {api_params}
  
        params do
          requires :user_id, type: String, allow_blank: false
        #   requires :task_amount, type: String, allow_blank: false
          # requires :securityToken, type: String, allow_blank: false
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false        
        end
  
        post do
          begin
            user =User.find(params['user_id']) #valid_user(params['userId'].to_i, params['securityToken'])
            if user.present?
              pointhistory=[]
              acc=user.account
              pointData=Point.where(account_id: acc.id)
              pointData.each do |p|
                 pointhistory << {
                  Task_name: p.name, 
                  Task_logo: p.logo, 
                  task_amount: p.coins,
                  Account_id: p.account_id,
                  Date: p.created_at
                 }
              end

              {message: "MSG_SUCCESS", status: 200, pointhistory: pointhistory}
            else
              {message: "INVALID_USER", status: 500} 
            end
  
          rescue Exception => e
            puts "API Exception-#{Time.now}-Earn_History-#{params.inspect}-Error-#{e}"
            { message: MSG_ERROR, status: 500 }
          end
      end
    end  
  end