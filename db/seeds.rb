{
  admin: "Account with administrative rights",
  moderator: "Moderator role. Allows to update other's posts and comments",
  editor: "Account is allowed to create own posts, publish them and update them"
}.each_pair do |name, description|
  Theblog::Role.create!(name: name, description: description)
end
