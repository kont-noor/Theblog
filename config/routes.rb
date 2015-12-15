Theblog::Engine.routes.draw do
  namespace :admin do
    [:pages, :posts, :categories].each do |res|
      resources res do
        put :draft
        put :publish
        put :block
        put :unblock
      end
    end

    resources :content_statuses
    root 'dashboard#index'
  end

  get '/:slug' => 'content_nodes#show', :as => :root_content_node
  get '/:category/:slug' => 'content_nodes#show', :as => :content_node
  root 'home#index'
end
