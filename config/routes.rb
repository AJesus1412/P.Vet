Rails.application.routes.draw do

match '/auth/:provider/callback' => 'authentications#create', via: [:get]
  resources :authentications

  resources :request_details

  resources :requests

  devise_scope :vet do
     get 'vets', to: 'vets/registrations#index', as: 'vet'
     get 'vet/popup', to: 'vets/registrations#popup', as: 'vet_popup'
  end
  devise_for :vets , controllers:{registrations:'vets/registrations', sessions:'vets/sessions'}

  devise_for :users , controllers:{registrations:'users/registrations', sessions:'vets/sessions'}
  resources :pets

  resources :families

  resources :service_types


  resources :species


  resources :breeds

  resources :services


  root 'home#index'

  get 'home/index'


  resources :services



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)cmd
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
