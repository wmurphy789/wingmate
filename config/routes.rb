Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: '/auth'

      resources :users do
        collection do
          post :check_usernames
          get :get_profile
          get :recover_password
          get :get_users_league
        end
      end

      resources :leagues do
        collection do
          post :add_achievement
          put :add_league
          get :pending
          put :remove_league
          put :addUser
          put :updateLeague
        end
      end

      resources :achievements do
        collection do
          
        end
      end

      resources :achievement_types do
        collection do
          
        end
      end

      resources :activities do
        collection do
          
        end
      end

    end
  end

  namespace :admin do
    resources :users do
      collection do
        
      end
    end
  end


  root 'dashboard#index'
  
end
