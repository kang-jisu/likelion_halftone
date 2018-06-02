Rails.application.routes.draw do
  devise_for :users
  root 'post#index'
  
  post '/post/create'=>'post#create'
  get '/post/show/:id'=>'post#show'
  get '/post/delete/:id'=>'post#delete'
  get '/post/write' => 'post#write'
  
  
  get '/comment/delete/:id' => 'comment#delete'
  post '/comment/create/:id'=>'comment#create'
  
  
  get '/post/edit/:id' =>'post#edit'
  post '/post/update/:id' =>'post#update'
end
