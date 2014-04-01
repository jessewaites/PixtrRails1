Pixtr::Application.routes.draw do

  root "homes#show"

  resource :dashboard, only: [:show]
  
  resources :galleries do 
    resources :images, only: [:new, :create]
    member do
      post "like" => "gallery_likes#create"
      delete "unlike" => "gallery_likes#destroy"
    end
  end

  resources :images, except: [:new, :create] do
    resources :comments, only: [:create]
    member do
      post "like" => "image_likes#create"
      delete "unlike" => "image_likes#destroy"
    end
  end  
  
  resources :groups, only: [:new, :index, :create, :show] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
      post "like" => "group_likes#create"
      delete "unlike" => "group_likes#destroy"
    end
  end    

  
  resources :users, only: [:index, :show] do
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end

  resources :comments, only: [:destroy]
  
end

 
