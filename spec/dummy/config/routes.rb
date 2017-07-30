Rails.application.routes.draw do
  mount Incarnator::Engine => "/"
  mount Theblog::Engine => "/theblog"
  root to: redirect('/theblog')
end
