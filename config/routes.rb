Rails.application.routes.draw do
  root to: "links#new"
  resources :links

  get '*a', to: "application#redirect_to_short_link"
end
