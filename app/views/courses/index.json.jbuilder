json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :tutor, :days, :start_date, :end_date, :time, :venue, :cost, :currency, :price, :tag, :avatar, :validate_course
  json.url course_url(course, format: :json)
end
