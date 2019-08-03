Rails.application.routes.draw do
  resources :tests do
    collection do
      delete :destroy_all
    end
  end
  root to: 'visitors#index'
end
