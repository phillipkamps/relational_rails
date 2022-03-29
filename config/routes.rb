Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  post "/teams", to: "teams#create"
  get "/teams/:id/players", to: "teams_players#index"
  get "/teams/:id", to: "teams#show"

  get "/players", to: "players#index"
  get "/players/:id", to: "players#show"
end
