Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answers, only: %i[create destroy], shallow: true
  end

  root to: 'questions#index'

  post '/questions/:question_id', to: 'answers#create'
end
