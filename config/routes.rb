Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/top", to: "url#top"

  post "/url", to: "url#create"

  get "/:friendly_url", to: "url#redirect_friendly_url"

end
