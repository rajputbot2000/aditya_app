Rails.application.routes.draw do
  resources :user_profiles
  resources :applists
  resources :rewards
  resources :points
  resources :withdrawls
  resources :transactions
  resources :accounts
  resources :appopens
  resources :users
  resources :game_points
  resources :tasks
  resources :news
  resources :matches
  resources :players
  resources :teams

  mount Matchlist => '/'
  mount Previewlist => '/'
  mount Playerlist => '/'
  mount Tasklist => '/'
  mount Signup => '/'
  mount Apopen => '/'
  mount Appinvite => '/'
  mount RewardList => '/'
  mount WithdrawlCreate => '/'
  mount WithdrawlHistory => '/'
  mount Gameplay => '/'
  mount Topfantasyapps => '/'
  mount Spintask => '/'
  mount EarnHistory => '/'
  mount Profilelist => '/'

  root "matches#index"

  get "dashboard/index"

  get "players", to: "teams#players"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
