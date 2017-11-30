Rails.application.routes.draw do

  root 'cocktails#index'

  resources :cocktails do
    resources :doses, only: [:new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
