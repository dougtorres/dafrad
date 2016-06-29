Rails.application.routes.draw do
  get 'hello/:name', to: 'hello#index'
  get 'hellon/:id', to: 'hello#hello'
  get '/calc/add/:num1/:num2', to: 'calc#add'
  get '/calc/sub/:num1/:num2', to: 'calc#sub'
  # get 'hello/index'
  # get 'hello/index', to: 'hello#index'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
