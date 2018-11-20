Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "top", to: "url#index"

  match "url", to: "url#create", via: [:get, :post]

  get ":friendly_url", to: "url#show"
end
