Rails.application.routes.draw do
  post 'vote/thumbs_up/:id', to: 'vote#thumbs_up'
  get 'vote/thumbs_up'

  post 'vote/thumbs_down/:id', to: 'vote#thumbs_down'
  get 'vote/thumbs_down'

  post 'vote/unvote/:id', to: 'vote#unvote'
  get 'vote/unvote'

  devise_for :users, controllers: {
    sessions: 'user/sessions'
  }
  resources :share, only: [:new, :create] do
  end

  root to: 'home#index'
end
