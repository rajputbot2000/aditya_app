class Appinvite < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all
    resource :Appinvite do
        desc "Invite Page API"
        # before {api_params}
        params do
          requires :user_id, type: String, allow_blank: false
          # requires :securityToken, type: String, allow_blank: false
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false        
        end
        post do
          begin
            # @user = valid_user(params['user_id'].to_i, params['securityToken'])
            user=User.find(params[:user_id])
            if user.present?
              inviteFbUrl = "https://bankboss.app/invite/#{user.account.refer_code}/?by=facebook"            
              inviteText = "Share, Invite Friends and Earn CricGuru Coins.\n ► Get 500 CricGuru Coins instant as your Friend Register on CricGuru App.\n ► Get a Chance to Earn upto 10,000 CricGuru Coins for Top Inviters.\n ► Sponsorship for YouTube, WhatsApp, Telegram and Facebook Content Creator Available!"
              inviteTextUrl = "Download CricGuru App and get free Paypal/Paytm cash upto Rs.500 for OfferTasks, Referral & Games. Click here: https://bankboss.app/invite/#{user.account.refer_code}/?by=social"            
              {message: "MSG_SUCCESS", status: 200, referralCode: user.account.refer_code, currency: '₹', inviteFbUrl: inviteFbUrl, inviteTextUrl: inviteTextUrl, inviteText: inviteText}
            else
              {message: "INVALID_USER", status: 500}
            end
          rescue Exception => e
            puts "API Exception-#{Time.now}-Appinvite-#{params.inspect}-Error-#{e}"
            {message: "MSG_ERROR", status: 500}
          end
        end
      end 
    end