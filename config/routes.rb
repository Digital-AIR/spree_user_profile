Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :api do
  	namespace :v2 do
      namespace :storefront do
      	resource :account, controller: :account, only: %i[show create update destroy]
      	namespace :account do
          resources :profile, controller: :profile, only: %i[create]
        end
      end
    end
  end
end
