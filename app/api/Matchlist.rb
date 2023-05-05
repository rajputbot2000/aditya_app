class Matchlist < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Matchlist do
        post do
            begin
                user = true #valid_user(params['userId'].to_i, params['securityToken'])
                if user
                    matchList = Match.all
                    
                    # match = Team.all
                    teamDetails=[]

                    matchList.each do |match|

                        t1=Team.find_by(name: match.front_team)
                        t2=Team.find_by(name: match.opp_team)

                        teamDetails1 = {id: t1.id, name:t1.name, code:t1.code}
                        teamDetails2 = {id: t2.id, name:t2.name, code:t2.code}
                        
                        teamDetails << { match_id: match.id, title: match.title, short_title: match.short_title, views: match.views, is_live: match.is_live, status: match.status, front_team: teamDetails1,opp_team: teamDetails2}
                    end
                    
                    
                    {message: 'MSG_SUCCESS', status: 200, matchDetails: teamDetails}
                    else
                    {message: 'INVALID_USER', status: 500}
                end
               rescue Exception => e
                puts "API Exception-#{Time.now}-matchListAPI-#{params.inspect}-Error-#{e}"
                {message: 'MSG_ERROR', status: 500}
            end
        end
    end

end

    # resource :Previewlist do

    #     params do
    #         requires :id , type: Integer
    #     end
    #     post do
    #         begin
    #             user = true 
    #             if user
    #                 match = Match.find(params[:id])

    #                 team1 = Team.find_by(name: match.front_team)
    #                 team2 = Team.find_by(name: match.opp_team)

    #                 previewDetails=[]
    #                 # match = Team.all
    #                 playerDetails=[]

    #                 team1.players.each do |player|
    #                 playerDetails << { player_id: player.id, name: player.name, score: player.score }
    #                 end

    #                 previewDetails << {id: team1.id, name: team1.name, players: playerDetails }

    #                 {message: 'MSG_SUCCESS', status: 200, PreviewDetails: previewDetails}
    #                 else
    #                 {message: 'INVALID_USER', status: 500}
    #             end
    #            rescue Exception => e
    #             puts "API Exception-#{Time.now}-matchListAPI-#{params.inspect}-Error-#{e}"
    #             {message: 'MSG_ERROR', status: 500}
    #         end
    #     end