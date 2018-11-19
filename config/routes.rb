Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/top", to: "url#top", format: true

  match "/url", to: "url#url", via: [:get, :post], format: true

  get "/:friendly_url", to: "url#redirect_shortened_url"

end
