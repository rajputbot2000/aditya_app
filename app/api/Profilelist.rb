class Profilelist < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all
    resource :Profilelist do
        desc "App User Profile API"
        # before {api_params}

        params do
          requires :userId, type: String, allow_blank: false
          optional :userName, type: String, allow_blank: true
          optional :userEmail, type: String, allow_blank: true
          optional :mobileNumber, type: String, allow_blank: true
          optional :gender, type: String, allow_blank: true
          optional :location, type: String, allow_blank: true
          optional :occupation, type: String, allow_blank: true
          optional :birthDate, type: String, allow_blank: true
          optional :profile_pic, type: String, allow_blank: true
        #   requires :securityToken, type: String, allow_blank: false
        #   requires :versionName, type: String, allow_blank: false
        #   requires :versionCode, type: String, allow_blank: false
          optional :actionType, type: String, allow_blank: false #(get/post)
        end

        post do
          begin
            user = User.find(params[:userId])#valid_user(params['userId'].to_i, params['securityToken'])
            if user
            #   source_ip = env['REMOTE_ADDR'] || env['HTTP_X_FORWARDED_FOR']
              if params['actionType'] == 'post'
                profile = UserProfile.where(user_id: user.id).first_or_initialize              
                if profile.new_record?
                  profile.update(
                    full_name: params['userName'] , 
                    email: params['userEmail'], 
                    mobile_number: params['mobileNumber'],
                    gender: params['gender'], 
                    location: params['location'], 
                    occupation: params['occupation'],
                    birth_date: params['birthDate'], 
                    profile_pic: params['profile_pic'])
                else
                  profile.update(
                    full_name: ( params[:userName].nil? ? profile.full_name : params['userName']),
                    email: ( params[:userEmail].nil? ? profile.email : params['userEmail'] ),
                    mobile_number: ( params[:mobileNumber].nil? ? profile.mobile_number : params['mobileNumber']),
                    gender: ( params[:gender].nil? ? profile.gender : params['gender']),
                    location: ( params[:location].nil? ? profile.location : params['location']),
                    occupation: ( params[:occupation].nil? ? profile.occupation : params['occupation']) ,
                    birth_date: ( params[:birthDate].nil? ? profile.birth_date : params['birthDate']),
                    profile_pic: ( params[:profile_pic].nil? ? profile.profile_pic : params['profile_pic']) )
                  end
                {message: "MSG_SUCCESS", status: 200, msg: 'User Profile Submitted.'}
              else
                user_profile = UserProfile.where(user_id: user.id).first            
                if user_profile.present?
                  {message: "MSG_SUCCESS", status: 200, userName: user_profile.full_name.to_s, userEmail: user_profile.email.to_s, mobileNumber: user_profile.mobile_number.to_s,
                    gender: user_profile.gender.to_s, location: user_profile.location.to_s, occupation: user_profile.occupation.to_s, birthDate: user_profile.birth_date.to_s,
                    socialImgurl: user_profile.profile_pic.to_s}
                else
                  {message: "MSG_SUCCESS", status: 200, userName: user.socialName, userEmail: user.socialEmail, mobileNumber: '',
                    gender: '', location: '', occupation: '', birthDate: '', socialImgurl: user.socialImgurl}
                end              
              end            
            else
             {message: "INVALID_USER", status: 500}
            end  

          rescue Exception => e
            puts "API Exception-#{Time.now}-Profilelist-#{params.inspect}-Error-#{e}"
            {message: "MSG_ERROR", status: 500}
          end
        end
      end
    end