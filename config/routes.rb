Rails.application.routes.draw do
  resources :tweets , only:[:index,:create]
end
