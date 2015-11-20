Rails.application.routes.draw do

  mount Incarnator::Engine => "/incarnator"
  mount Yablog::Engine => "/yablog"
end
