ContentManager::Engine.routes.draw do
  resources :articles, except: :show
  resources :categories, except: [:new, :create, :show]
  resources :tags, except: :show
end