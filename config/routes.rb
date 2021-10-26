Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :chatrooms do
        resources :messages
      end
      # resources :login, only: %i[create]
      # resources :auto_login, only: %i[create]
    end
  end
end
