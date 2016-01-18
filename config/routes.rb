Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: "user_sessions",
                                      registrations: "registrations",
                                      passwords: "passwords",
                                      confirmations: "confirmations",
                                      unlocks: "unlocks"}

  root 'events#show'

  get 'coc'        => 'events#coc'
  get 'sponsor'    => 'events#sponsor'


  resources :events, only: [:index, :show] do
    member do
      get 'schedule'
      resources :sessions, only: [:index, :show]
    end
    resources :submissions
  end

  namespace "admin" do
    resources :events, only: :index do
      resources :submissions, only: :index
    end
    resources :submissions, only: nil do
      resources :votes, only: :create
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
