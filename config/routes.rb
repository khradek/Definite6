Rails.application.routes.draw do

  resources :saved_plays

  resources :saved_formations do
    put :sort, on: :collection
  end

  resources :events do
  	resources :scripts, controller: 'events/scripts'
  	resources :plays, controller: 'events/plays' do
  		put :sort, on: :collection
  	end
  end

  devise_for :users
  
  root 'creatives#index'

end
