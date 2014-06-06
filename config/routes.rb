Rails.application.routes.draw do
  resources :students

  resources :courses
  
  authenticated :user do    
    root :to => 'student_dashboard#index', as: :authenticated_root    
  end

  root :to => "visitors#index"
  
  #devise_for :users, :controllers => {sessions: 'sessions'}  
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users
  
  match 'remote_sign_up', to: 'remote_content#remote_sign_up', via: [:get]
  

  match 'remote_sign_in', to: 'remote_content#remote_sign_in', via: [:get]

  get '/available_courses' => "visitors#courses", as: :all_courses

  #, as: :user_root
  #get '/student' => "student_dashboard#index", as: :student_dashboard
  get '/administrator' => "admin_view#index", as: :admin_root
  
  
      
end