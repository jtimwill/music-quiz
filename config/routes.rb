Rails.application.routes.draw do
  root to: 'quizzes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  resources :users, except: [:index, :destroy]
  resources :quizzes, except: [:index, :destroy] do 
    resources :puzzles, only: [:create]
  end
end
