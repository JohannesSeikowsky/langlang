Rails.application.routes.draw do

  # views
  root "views#home"
  # learning views  
  get "learning", to: "views#learning", as: "learning"
  # user mgmt
  post "new_user", to: "users#new_user", as: "new_user"
  post "login", to: "users#login", as: "login"
  get "logout", to: "users#logout", as: "logout"

end
