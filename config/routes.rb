Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :cities, :only => :index
    resources :zipcodes

    resources :countries do
      resources :states do
        resources :cities do
        end
      end
    end
  end

  namespace :api, :defaults => { :format => 'json' } do
    resources :zipcodes
  end
end
