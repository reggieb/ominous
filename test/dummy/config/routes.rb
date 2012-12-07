Rails.application.routes.draw do

  resources :things


  mount Ominous::Engine => "/ominous"
end
