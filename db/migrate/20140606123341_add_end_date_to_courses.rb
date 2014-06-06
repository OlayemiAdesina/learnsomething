class AddEndDateToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :end_date, :date
    rename_column :courses, :date, :start_date
  end
end
