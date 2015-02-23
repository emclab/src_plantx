Rails.application.routes.draw do

  mount SrcPlantx::Engine => "/src_plantx"
  mount Commonx::Engine => "/commonx"
  mount Authentify::Engine => '/authentify'
  
  root :to => "authentify/sessions#new"
  get '/signin',  :to => 'authentify/sessions#new'
  get '/signout', :to => 'authentify/sessions#destroy'
  get '/user_menus', :to => 'user_menus#index'
  get '/view_handler', :to => 'authentify/application#view_handler'
end
