json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :title, :description, :date, :due
  json.url assignment_url(assignment, format: :json)
end
