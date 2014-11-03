Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Yablog::Engine => "/yablog"
  root 'yablog/home#index'
end
