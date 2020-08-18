json.extract! course, :id, :courseType, :title, :year, :created_at, :updated_at
json.url course_url(course, format: :json)
