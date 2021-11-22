json.extract! assessment, :id, :name, :desc, :active, :created_by_id, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)
