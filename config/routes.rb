Rails.application.routes.draw do

  root "views#home"
  get "learning", to: "views#learning", as: "learning"
  
  post "new_user", to: "users#new_user", as: "new_user"
  post "login", to: "users#login", as: "login"
  get "logout", to: "users#logout", as: "logout"

end
