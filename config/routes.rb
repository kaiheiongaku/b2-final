Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "surgeries/:surgery_id", to: "surgeries#create"
  resources :surgeries, only: [:index, :show]
end
