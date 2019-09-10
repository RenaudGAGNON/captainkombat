Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :menu, action: :index

  resources :menu, only: :index
  resources :characters

  controller :fights do
    get "player_selector", action: :player_selector
    post "fight", action: :fight
  end

end
