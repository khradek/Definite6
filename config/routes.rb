Rails.application.routes.draw do

  resources :saved_plays do
    put :sort, on: :collection
  end

  resources :saved_formations do
    put :sort, on: :collection
  end

  resources :events do
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

end
