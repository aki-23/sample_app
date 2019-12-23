json.array! @groups do |group|
  json.id group.id
  json.image_url group.image_url
  json.name group.name
end