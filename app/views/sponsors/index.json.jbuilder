json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :photo, :link
  json.sponsor_levels sponsor.sponsor_levels.map(&:name)
end
