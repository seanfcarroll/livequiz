Rails.application.routes.draw do

  resources :participants
  resources :participants
  resources :quizzes, constraints: { access_password: /^\d/ } do
  	resources :sessions, only: [:new, :create,:show, :edit]
  end

  resources :sessions, only: [:show, :edit, :update, :destroy] do

  	member do 

  		get 'start'
      get 'switch_to_next_question'
  		
  	end
  end

  get 'quiz_sessions/:session_key/:authorization_key/:authorization_password', to: "quiz_sessions#show"

  root to: "quizzes#new" 

end
