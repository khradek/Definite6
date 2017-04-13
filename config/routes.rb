Rails.application.routes.draw do

  resource :default_practice

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
    get :summary_1
    get :summary_2
    get :summary_3
    get :summary_4
    get :summary_5
    get :summary_6
    get :summary_7
    get :summary_8
    get :summary_9
    get :summary_10
    get :summary_11
    get :summary_12
    get :summary_13
    get :summary_14

  	resources :scripts, controller: 'events/scripts' do
      get :print
    end

  	resources :plays, controller: 'events/plays' do
      collection do
        delete :destroy_multiple
        put :update_multiple
        put :sort
      end
      member do
        put :type_update
        put :hash_update
        put :toggle1
        put :toggle2
        put :toggle3
        put :toggle4
      end
  	end

    resources :gamecalls, controller:'events/gamecalls' do
      get :print
    end

    resources :practice_schedules, controller:'events/practice_schedules' do
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
  get 'articles/the_quick_game_out'
  get 'articles/the_quick_game_slant'
  get 'articles/the_quick_game_stick'
  get 'articles/goal_line_part_one'
  get 'articles/coach_hrazor'

  get '/user_guide' => "pages#user_guide"

  get '/terms' => "pages#terms"

  get '/privacy' => "pages#privacy"

  get '/example_script' => "pages#example_script"

  get '/example_gamecall' => "pages#example_gamecall"

  get '/sitemap' => "pages#sitemap"

  get '/thank_you' => "pages#thank_you"

  get '/masquerade' => "pages#masquerade"

end
