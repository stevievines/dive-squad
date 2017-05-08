json.array!(@drills) do |drill|
  json.extract! drill, :id, :name, :progression, :skill_id
  json.url drill_url(drill, format: :json)
end
