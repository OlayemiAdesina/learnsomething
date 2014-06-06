require 'carrierwave/orm/activerecord'
require 'file_size_validator'
class Course < ActiveRecord::Base
  
  #authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :tutor, presence: true
  validates :start_date, presence: true  
  validates :time, presence: true
  validates :location, presence: true
  validates :venue, presence: true
 # validates :avatar, 
  #      :file_size => { :maximum => 5.megabytes.to_i} 
 # validates_integrity_of :avatar
 # validates_processing_of :avatar
  
  belongs_to :student  
  
  
  
  # Avatar uploader using carrierwave
  
  
end
