Rails.application.routes.draw do
  root "chat_rooms#index"

  devise_for :users, controllers: {
    sessions: "user/sessions",
    registrations: "user/registrations"
  }

  resources :chat_rooms, only: %i|index new create|
end
