class Previewlist < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Previewlist do

        params do
            requires :id , type: Integer
        end
        post do
            begin
                user = true 
                if user
                    match = Match.find(params[:id])

                    team1 = Team.find_by(name: match.front_team)
                    team2 = Team.find_by(name: match.opp_team)

                    nt1= News.find_by(team_id: team1.id)
                    nt2= News.find_by(team_id: team2.id)

                    previewDetails=[]
                    # previewDetails2=[]
                    # match = Team.all
                    playerDetails1=[]
                    playerDetails2=[]

                    team1.players.each do |player|
                        playerDetails1 << { player_id: player.id, name: player.name, score: player.score }
                    end

                    team2.players.each do |player|
                        playerDetails2 << { player_id: player.id, name: player.name, score: player.score }
                    end

                    previewDetails << {
                        front_team_id: team1.id,
                        name: team1.name,
                        front_team_players: playerDetails1,
                        front_team_news: nt1.news,
                        opp_team_id: team2.id,
                        opp_name: team2.name,
                        opp_team_players: playerDetails2,
                        opp_team_news: nt2.news
                    }
                    # previewDetails << {}

                    {message: 'MSG_SUCCESS', status: 200, PreviewDetails: previewDetails }
                    else
                    {message: 'INVALID_USER', status: 500}
                end
               rescue Exception => e
                puts "API Exception-#{Time.now}-PreviewListAPI-#{params.inspect}-Error-#{e}"
                {message: 'MSG_ERROR', status: 500}
            end
        end
    end
end