Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: "user_sessions",
                                      registrations: "registrations",
                                      passwords: "passwords",
                                      confirmations: "confirmations",
                                      unlocks: "unlocks"}

  root 'events#show'

  get 'coc'      => 'events#coc'
  get 'sponsor'  => 'events#sponsor'
  get 'admin'    => 'admin/admin#admin'
  get 'schedule' => 'events#schedule'

  resources :submissions
  resources :scholarship_applications, only: [:index, :new, :create]  do
    collection do
      get 'thanks'
    end
  end

  resources :sessions, only: [:index, :show]

  resources :events, only: [:index, :show] do
    member do
      get 'schedule'
      resources :sessions, only: [:index, :show]
    end
  end

  namespace "selection" do
    resources :submissions, only: :index do
      resources :votes, only: [:create, :destroy]
    end
  end

  namespace "admin" do
    resources :submissions, only: :index do
      collection do
        post 'make_session'
      end
    end
    resources :sessions, only: :index do
      member do
        post 'schedule'
      end
    end
    resources :speakers
    resources :events
    resources :scholarship_applications, only: :index
    resources :users, only: :index do
      member do
        post 'make_selector'
        post 'make_admin'
      end
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
