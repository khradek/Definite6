Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :saved_plays do
    put :sort, on: :collection
  end

  resources :saved_formations do
    put :sort, on: :collection
  end

  resources :events do
    get :import_plays, on: :member
  	resources :scripts, controller: 'events/scripts' do
      get :print
    end
  	resources :plays, controller: 'events/plays' do
  		put :sort, on: :collection
  	end
    resources :gamecalls, controller:'events/gamecalls' do
      get :print
    end
  end

  devise_for :users
  
  root 'creatives#index'

  get 'pages/user_guide', :as => "user_guide_page"


end
