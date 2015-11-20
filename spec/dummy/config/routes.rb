Rails.application.routes.draw do

  mount Incarnator::Engine => "/incarnator"
  mount Theblog::Engine => "/theblog"
end
