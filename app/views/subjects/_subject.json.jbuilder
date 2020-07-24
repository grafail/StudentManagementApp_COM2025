json.extract! subject, :id, :course_id, :user_id, :description, :created_at, :updated_at
json.url subject_url(subject, format: :json)
