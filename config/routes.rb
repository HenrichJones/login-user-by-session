Rails.application.routes.draw do
  resources :users

  delete 'sing_out' => 'sessions#destroy'
  post   'sign_in'  => 'sessions#create'
  get    'sign_in'  => 'sessions#new'

end