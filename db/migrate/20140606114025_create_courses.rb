class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :tutor
      t.boolean :days
      t.date :date
      t.time :time
      t.string :venue
      t.boolean :cost
      t.string :currency
      t.decimal :price, precision: 10, scale: 3
      t.string :tag
      t.string :avatar
      t.boolean :validate_course

      t.timestamps
    end
  end
end
