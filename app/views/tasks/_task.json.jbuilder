json.extract! task, :id, :title, :task, :points, :reward, :logo, :created_at, :updated_at
json.url task_url(task, format: :json)
