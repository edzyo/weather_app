Rails.application.routes.draw do
  get "search", to: "weather#search"

  root 'weather#search'
end
