Spree::Core::Engine.routes.prepend do
  resources :inquiries, :only => [:new, :create, :index]

  namespace :admin do
    resources :inquiries, :only => [:index, :show]
    resource :inquiry_settings
  end

  match '/contact' => 'inquiries#new', :as => :contact
end
