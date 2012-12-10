Ominous::Engine.routes.draw do
  
  resources :warnings, :only => [:dismiss] do
    member do
      put :dismiss
    end
  end
end
