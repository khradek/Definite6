Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount StripeEvent::Engine, at: '/stripe/webhook'
  
  resources :saved_plays do
    put :sort, on: :collection
  end

  resources :saved_formations do
    put :sort, on: :collection
  end

  resources :events do
    get :import_plays, on: :member
    get :print
    get :sortable
  	resources :scripts, controller: 'events/scripts' do
      get :print
    end
  	resources :plays, controller: 'events/plays' do
      collection do
        delete :destroy_multiple
        put :update_multiple
      end
  		put :sort, on: :collection
  	end
    resources :gamecalls, controller:'events/gamecalls' do
      get :print
    end
  end

  devise_for :users, controllers: { registrations: "registrations" }

  resources :charges

  resource :subscription

  resource :card
  
  root 'creatives#index'

  #Articles
  get 'articles/index'
  get 'articles/practice_organization'
  get 'articles/naming_formations'
  get 'articles/our_most_productive_rpo'
  get 'articles/goals_and_objectives'
  get 'articles/the_quick_game_hitch'
  get 'articles/the_quick_game_fade'


  get '/user_guide' => "pages#user_guide"

  get '/terms' => "pages#terms"

  get '/privacy' => "pages#privacy"

  get '/example_script' => "pages#example_script"

  get '/example_gamecall' => "pages#example_gamecall"


end
