json.array!(@completed_assignments) do |completed_assignment|
  json.extract! completed_assignment, :id, :user_id, :assignments_id, :url, :completed
  json.url completed_assignment_url(completed_assignment, format: :json)
end
