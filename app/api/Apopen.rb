
class Apopen < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Apopen do
    desc "App Open API"
    # before {api_params}
    params do
      requires :userId, type: String, allow_blank: false
      # requires :securityToken, type: String, allow_blank: false
      # requires :versionName, type: String, allow_blank: false
      # requires :versionCode, type: String, allow_blank: false
    end
    post do
      @user = User.find(params[:userId])
      result = request.location
                if @user
                  #  force_update = false
                  #  if(params['versionName']!='1.6' && params['versioncode']!='7')
                  #      force_update = false
                  #  end
                p=@user.appopens.create(
                    { 
                      version_name: params[:versionName], 
                      version_code: params[:versionCode],
                      location: result.city,
                      source_ip: result.ip
                    }
                  )
                end
                # p=Geocoder.search("204.57.220.1")
                {status: 200, message: "MSG_SUCCESS", anything: p, coordinates: result.coordinates}
            rescue Exception => e
            puts "API Exception-#{Time.now}-Signup-#{params.inspect}-Error-#{e}"          
            {message: "MSG_ERROR", status: 500}          
    end
  end
end