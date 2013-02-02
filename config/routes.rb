KtitengineeringCom::Application.routes.draw do

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'ktit_engineering#index'

  resources :services, :only => [] do
    collection do
      post :view
    end
  end
  resources :contacts, :only => [:index,:create] do
    collection do
      post :view
      post :lodge
    end
  end
end
