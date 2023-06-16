InsalesApp::Application.routes.draw do
  root 'main#index'

  get '/install',   to: 'insales_app#install',   as: :install
  get '/uninstall', to: 'insales_app#uninstall', as: :uninstall
  get '/login',     to: 'sessions#new',          as: :login
  get '/main',      to: 'main#index'

  resource :session, only: %i[new show create destroy] do
    collection do
      get :autologin
    end
  end

  get ':controller/:action/:id'
  get ':controller/:action/:id.:format'
end
