Rails.application.routes.draw do
  get 'comments/new'
  get '/questions/preview', to: 'questions#preview'
  get '/answers/typeEntry', to: 'questions#typeEntry'

  devise_for :users
  root 'questions#index'
  
  resources :questions do
    resources :comments, only: [:create, :destroy, :edit, :update]
    resources :answers
    resources :votes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :answers do
    resources :comments, only: [:create, :destroy, :edit, :update]
    resources :votes, only: [:create, :destroy]
  end

end

#/questions/:id/votes/create


#/questions/:question_id/answers/:id/votes/create

#si le paso una url que requiere dos ids hago _path(vote_type, vote_type_id)