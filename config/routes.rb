Ominous::Engine.routes.draw do
  
  resources :warnings do
    member do
      put :dismiss
    end
  end
end
