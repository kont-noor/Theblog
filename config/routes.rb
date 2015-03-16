Yablog::Engine.routes.draw do
  namespace :admin do
    resources :pages
    resources :posts
    resources :categories
    resources :content_statuses
    root 'dashboard#index'
  end

  devise_for :users, class_name: "Yablog::User", module: :devise

  get '/:slug' => 'content_nodes#show', :as => :root_content_node
  get '/:category/:slug' => 'content_nodes#show', :as => :content_node
  root 'home#index'
end
