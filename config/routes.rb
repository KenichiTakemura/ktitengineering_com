KtitengineeringCom::Application.routes.draw do

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'ktit_engineering#index'
  match 's' => "smarts#index", :via => :get, :as => :smart
  match 'counters/batch', :via => :get
  resources :services, :only => [] do
    collection do
      post :view
    end
  end
  resources :contacts, :only => [:index,:create,:new] do
    collection do
      post :view
      post :lodge
      post :smart_create
    end
  end
end
