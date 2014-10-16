Yablog::Engine.routes.draw do
  devise_for :users, class_name: "Yablog::User", module: :devise
  resources :pages
  get '/:slug' => 'pages#show', :as => :menu_item
  root 'home#index'
end
