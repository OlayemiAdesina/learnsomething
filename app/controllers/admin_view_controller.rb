class AdminViewController < ApplicationController 
  # unless Rails.application.config.consider_all_requests_local
  rescue_from AdminViewController::NoMethodError, with: :handle_error  
  def handle_error
    redirect_to root_path
  end
  
  
  def index
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path        
      end
    end
  end
  
end
