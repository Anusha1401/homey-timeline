project = Project.create!(name: "Website Redesign")

project.comments.create!(
  user_name: "Alice",
  body: "We should use a modern design system."
)

project.status_changes.create!(
  user_name: "Bob",
  status: "in_progress"
)

project.comments.create!(
  user_name: "Charlie",
  body: "Added the first draft of the UI."
)

project.status_changes.create!(
  user_name: "Alice",
  status: "review"
)