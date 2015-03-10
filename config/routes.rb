Yablog::Engine.routes.draw do
  devise_for :users, class_name: "Yablog::User", module: :devise
  resources :pages
  resources :posts, only: :show
  get '/:slug' => 'content_nodes#show', :as => :root_content_node
  get '/:category/:slug' => 'content_nodes#show', :as => :content_node
  root 'home#index'
end
