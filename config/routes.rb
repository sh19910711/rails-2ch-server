Rails2chServer::Application.routes.draw do
  resources :board_manager, :only => [:index]

  resource :bbs_boards, :only => [] do
    member do
      get(
        '',
        :action => :index,
        :as => '',
      )
      post(
        '',
        :action => :create,
        :as => '',
      )
      post(
        'create_thread',
        :action => :create_thread,
        :as => 'create_thread',
      )
    end
  end

  resources :bbs_boards, :only => [] do
    member do
      get(
        '',
        :action => :show,
        :as => '',
      )
      get(
        'edit',
        :action => :edit,
      )
      delete(
        '',
        :action => :delete,
        :as => '',
      )
    end
  end

  resource :bbs_threads, :only => [] do
    member do
      get(
        '',
        :action => :index,
        :as => '',
      )
      post(
        '',
        :action => :create,
        :as => '',
      )
    end
  end

  resources :bbs_threads, :only => [] do
    member do
      get(
        '',
        :action => :show,
        :as => '',
      )
      get(
        'edit',
        :action => :edit,
      )
      delete(
        '',
        :action => :delete,
        :as => '',
      )
      delete(
        ':return_url',
        :action => :delete,
        :as => 'delete',
      )
      post(
        'create_response/:success_callback_url',
        :action => :create_response,
        :as => 'create_response',
      )
    end
  end

  resource :bbs_responses, :only => [] do
    member do
      get(
        '',
        :action => :index,
        :as => '',
      )
    end
  end

  resources :bbs_responses, :only => [] do
    member do
      get(
        'edit',
        :action => :edit,
      )
      delete(
        ':success_callback_url',
        :action => :delete,
        :as => '',
      )
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
