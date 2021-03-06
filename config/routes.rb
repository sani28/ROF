Rails.application.routes.draw do
  #get 'welcome/index'

  root to: 'welcome#index'
  # get 'user_questions/index'

  # get 'answers/index'

  # get 'answers/new'

  # get 'answers/create'

  # get 'answers/destroy'

  # get 'drill_groups/index'

  # get 'drill_groups/new'

  # get 'drill_groups/create'

  # get 'drill_groups/destroy'

  # get 'badges/index'

  # get 'questions/index'

  # get 'questions/new'

  # get 'questions/create'

  # get 'questions/show'

  # get 'questions/destroy'
  get 'users/leaderboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show]

  resources :questions, only: [:new, :create, :destroy, :index, :show] do
    resources :users_questions, only: [:create, :update]
  end


  resources :answers, only: [:new, :create, :destroy, :index]

# create questions routes
  resources :drill_groups, only: [:new, :create, :destroy, :index, :show] do
   resources :questions, only: [:new, :create, :destroy, :index, :show]
  end


  resource :session, only: [:new, :create, :destroy]

  resources :questions, only: [] do
    resources :answers, only: [:new, :create, :destroy, :index]
  end

end
