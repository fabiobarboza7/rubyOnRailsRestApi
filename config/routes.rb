Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      devise_for :users, :controllers => {sessions: 'api/v1/sessions', registrations: 'api/v1/registrations'}
      resources :users, only: [:index];
    end
  end  
end

