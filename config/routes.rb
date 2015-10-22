Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts do
    post :import
    get :export
  end
end
