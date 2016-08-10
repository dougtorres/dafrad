Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get 'feed' => 'articles#feed'
  resources :articles  do
    resources :comments
  end

end
