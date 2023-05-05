class Tasklist < Grape::API
    version 'v2', using: :path
    format :json
    prefix :api

    rescue_from :all

    resource :Tasklist do
       post do
        begin
            user = true #valid_user(params['userId'].to_i, params['securityToken'])
                if user
                    Taskdata = []                
                    TaskList = Task.all
                    TaskList.each do |task|
                       Taskdata << {
                        id: task.id, 
                        title: task.title,
                        task: task.task, 
                        points: task.points,
                        reward: task.reward,
                        logo: task.logo
                    }
                    end               
                {message: 'MSG_SUCCESS', status: 200, TaskList: Taskdata}
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