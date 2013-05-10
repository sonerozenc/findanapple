UsersApp::Application.routes.draw do
  resources :users, :except => [ :new, :edit, :create ], defaults: {format: :json}
  
  root :to => 'site#index'
end
