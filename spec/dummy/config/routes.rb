Rails.application.routes.draw do
  mount Yablog::Engine => "/yablog"
  root 'yablog/home#index'
end
