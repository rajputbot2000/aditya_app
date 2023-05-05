class Topfantasyapps < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Topfantasyapps do
        post do
            begin
                user = true #valid_user(params['userId'].to_i, params['securityToken'])
                if user
                    mouse = []
                    aditya= Applist.all
                    aditya.each do |list|
                        mouse << {
                            id: list.id,
                            title: list.title, 
                            logo_thumbnail: list.logo, 
                            app_link: list.app_link,
                            redeem_type: list.redeem_type,
                            bonus: list.bonus,
                            minimum_withdrawl: list.minimum_withdrawl,
                            referral_code: list.referral_code
                        }       
                    end        
                {message: 'MSG_SUCCESS', status: 200, TopAppList: mouse}
                else
                {message: 'INVALID_USER', status: 500}
                end
               rescue Exception => e
                puts "API Exception-#{Time.now}-TopFantasyAppsAPI-#{params.inspect}-Error-#{e}"
                {message: 'MSG_ERROR', status: 500}
            end
        end
    end
end