Pixtr::Application.routes.draw do

  root "homes#show"
  
  resources :galleries do 
    resources :images, only: [:new, :create]
  end

  resources :images, except: [:new, :create] do
    resources :comments, only: [:create]
  end  
  
  resources :groups, only: [:new, :index, :create, :show] 

  
  resources :users, only: [:index, :show] do
    member do
      post "follow" => "following_relationships#create"
      post "unfollow" => "following_relationships#delete"
    end
  end    
  
end

 
