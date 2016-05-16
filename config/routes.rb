Rails.application.routes.draw do

  # view 
  root "views#home"
  # learning view
  get "learning", to: "views#learning", as: "learning"
  
  # login
  post "login", to: "users#login", as: "login"
  # signup
  post "new_user", to: "users#new_user", as: "new_user"
  # logout
  delete "logout", to: "users#logout", as: "logout"

end
