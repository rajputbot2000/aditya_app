class Signup < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Signup do
            desc "Signup API"
            # before {api_params}
            params do
                requires :deviceId, type: String, allow_blank: false
                optional :deviceType, type: String, allow_blank: true
                optional :deviceName, type: String, allow_blank: true
      
                requires :socialType, type: String, allow_blank: false
                requires :socialId, type: String, allow_blank: false
                optional :socialToken, type: String, allow_blank: false        
      
                optional :socialEmail, type: String, allow_blank: true
                optional :socialName, type: String, allow_blank: true
                optional :socialImgurl, type: String, allow_blank: true        
      
                optional :advertisingId, type: String, allow_blank: true        
                requires :versionName, type: String, allow_blank: false
                requires :versionCode, type: String, allow_blank: false
      
                optional :utmSource, type: String, allow_blank: true
                optional :utmMedium, type: String, allow_blank: true
                optional :utmTerm, type: String, allow_blank: true
                optional :utmContent, type: String, allow_blank: true
                optional :utmCampaign, type: String, allow_blank: true

                optional :referral_code, type: String, allow_blank: true


              end      
            post do
            begin
                user = User.where(socialId: params[:socialId]).first_or_initialize(
                        socialEmail:params[:socialEmail], 
                        socialName:params[:socialName], 
                        socialId:params[:socialId], 
                        socialType:params[:socialType], 
                        socialToken:params[:socialToken], 
                        socialImgurl:params[:socialImgurl], 
                        advertisingId:params[:advertisingId], 
                        securityToken: SecureRandom.uuid(),
                        deviceId: params[:deviceId],
                        deviceType: params[:deviceType],
                        deviceName: params[:deviceName],
                        versionName: params[:versionName], 
                        versionCode: params[:versionCode],
                        utmSource: params[:utmSource],
                        utmMedium: params[:utmMedium],
                        utmTerm: params[:utmTerm],
                        utmContent: params[:utmContent],
                        utmCampaign: params[:utmCampaign]
                    )
                    user.save
                   
                    if user.account.present?
                        accnt=user.account
                    else
                        if params[:referral_code].present?
                            acc=Account.find_by(refer_code: params[:referral_code])
                            accnt=Account.create(user_id: user.id, coin_balance: 1500, refer_code: SecureRandom.alphanumeric(6))
                            Point.create(
                                logo: 'https://w7.pngwing.com/pngs/694/843/png-transparent-referral-marketing-computer-icons-graphics-illustration-affiliate-icon-logo-social-media-marketing-business-thumbnail.png', 
                                name: 'Referral bonus',
                                coins: 500,
                                account_id: acc.id
                              )
                            Point.create(
                                logo: 'https://png.pngtree.com/png-clipart/20200224/original/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg', 
                                name: 'Sign up through Referral bonus',
                                coins: 1500,
                                account_id: accnt.id
                              )
                            acc.coin_balance = acc.coin_balance.to_i + 500
                            acc.save!
                        else
                            accnt=Account.create(user_id: user.id, coin_balance: 1000, refer_code: SecureRandom.alphanumeric(6))
                            p = Point.create(
                                logo:  'https://png.pngtree.com/png-clipart/20200224/original/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg', 
                                name: 'Sign up bonus',
                                coins: 1000,
                                account_id: accnt.id
                              )
                        end
                    end


                {status: 200, message: "MSG_SUCCESS" , user: user.id , securityToken: user.securityToken, account: accnt}
            rescue Exception => e
                puts "API Exception-#{Time.now}-Signup-#{params.inspect}-Error-#{e}"          
                {message: "MSG_ERROR", status: 500}          
            end
            end
        end
end