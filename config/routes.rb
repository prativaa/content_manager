ContentManager::Engine.routes.draw do
  resources :articles, except: :show
  resources :categories, except: :show
  resources :tags, except: :show
  mount Ckeditor::Engine => '/ckeditor'
end