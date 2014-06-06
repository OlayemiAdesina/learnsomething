class VisitorsController < ApplicationController
  def index
    @home = true
  end
  
  def courses
    @courses = Course.all
  end
end
