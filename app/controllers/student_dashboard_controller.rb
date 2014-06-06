class StudentDashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user.admin?      
        redirect_to admin_root_path
    end
  end
  
end