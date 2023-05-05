class Gameplay < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Gameplay do
        post do
            begin
                user = true #valid_user(params['userId'].to_i, params['securityToken'])
                if user
                GameList = []                
                GameData = GamePoint.all
                game_slider = []
                play_games = GameData.where("link != ?", '')

                play_games.each do |video|
                   game_slider << {Game_Link: video.link, Image_thumbnail: video.img}
                end

                GameData.each do |game|
                   GameList << {Id: game.id, Title: game.title, Image_thumbnail: game.img, Game_link: game.link, Game_amount: game.game_amount}
                end             

                {message: 'MSG_SUCCESS', status: 200,gameSlider: game_slider.sample(3), GameList: GameList}
                else
                {message: 'INVALID_USER', status: 500}
                end
               rescue Exception => e
                puts "API Exception-#{Time.now}GameListAPI-#{params.inspect}-Error-#{e}"
                {message: 'MSG_ERROR', status: 500} 
            end
        end
    end
end