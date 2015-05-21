json.array! roles do |role|
  json.(role, :id, :name)
end