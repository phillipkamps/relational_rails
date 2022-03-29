Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  post "/teams", to: "teams#create"
  get "/teams/:id/players", to: "teams_players#index"
  get "/teams/:id/edit", to: "teams#edit"
  patch "/teams/:id", to: "teams#update"
  get "/teams/:id", to: "teams#show"

  get "/players", to: "players#index"
  get "/teams/:id/players/new", to: "teams_players#new"
  post "/teams/:id/players", to: "teams_players#create"
  get "/players/:id", to: "players#show"
end
