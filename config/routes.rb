Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/top", to: "url#top"

  # match "/url", to: "url#url", via: [:get, :post], format: true
  get "/url", to: "url#url"
  post "/url", to: "url#url"

  get "/:friendly_url", to: "url#redirect_friendly_url"

end
