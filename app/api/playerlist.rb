class Playerlist < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Playerlist do
        post do
            begin
                user = true #valid_user(params['userId'].to_i, params['securityToken'])
                if user
                PlayerList = []                
                    PlayerData = Player.all
                    PlayerList << PlayerData               
                {message: 'MSG_SUCCESS', status: 200, PlayerList: PlayerList}
                else
                {message: 'INVALID_USER', status: 500}
                end
               rescue Exception => e
                puts "API Exception-#{Time.now}-PlayerListAPI-#{params.inspect}-Error-#{e}"
                {message: 'MSG_ERROR', status: 500}
            end
        end
    end
end