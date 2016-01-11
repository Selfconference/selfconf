Rails.application.routes.draw do
  root 'events#show'

  get    'signup'  => 'users#new'
  get    'login'   => 'user_sessions#new'
  post   'login'   => 'user_sessions#create'
  delete 'logout'  => 'user_sessions#destroy'
  get 'coc'        => 'events#coc'
  get 'sponsor'    => 'events#sponsor'

  resources :users
  resources :events, only: [:index, :show] do
    member do
      get 'schedule'
      resources :sessions, only: [:index, :show]
    end
    resources :submissions
  end

  scope 'api', defaults: { format: :json } do
    resources :venues, only: [:index, :show]

    resources :events, only: [:index, :show] do
      collection do
        get 'latest'
      end
      member do
        resources :speakers, :sponsors, :sponsor_levels, :venue,
                  :rooms, :organizers, :sessions, only: [:index, :show]
      end
    end

    resources :sessions, only: [:index, :show] do
      member do
        resources :feedbacks, only: :create
      end
    end
  end
end
