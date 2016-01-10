Rails.application.routes.draw do
  root 'events#show'

  resources :events, only: [:index, :show] do
    member do
      get 'coc'
      get 'sponsor'
      get 'contact'
      get 'schedule'
      resources :sessions, only: [:index, :show]
    end
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
