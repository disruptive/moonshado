#config/routes.rb
Rails.application.routes.draw do |map|
  resources :messages, :controller => 'moonshado/messages', :only => [:index, :show, :new, :create, :destroy] do
		member do
			post 'receive'
			post 'report'
		end
  end
end