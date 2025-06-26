# Create projects
project1 = Project.create!(name: "Homey Frontend")
project2 = Project.create!(name: "Homey Backend")
project3 = Project.create!(name: "Homey AI Core")
project4 = Project.create!(name: "Homey Analytics")
project5 = Project.create!(name: "Homey API Gateway")
project6 = Project.create!(name: "Homey Dashboard")

# Define sample statuses and comments
statuses = ["Not Started", "In Progress", "Review", "Completed"]
comments = [
  "Great progress so far, keep it up!",
  "Can we get an update on the timeline?",
  "I think we should prioritize bug fixes next.",
  "The new feature looks promising.",
  "Please add more test coverage.",
  "This part of the UI feels a bit clunky.",
  "Looks good to me, ready for review.",
  "Can we have a demo for the stakeholders?",
  "Performance seems slower after the last update.",
  "Let's make sure this is mobile-friendly.",
  "I found a small typo in the documentation.",
  "Can we schedule a meeting to discuss next steps?",
  "This integrates well with the existing system.",
  "Please update the README with the new instructions.",
  "I love the new design changes!",
  "The API response time needs improvement.",
  "Can someone help me understand this module?",
  "We need to address security concerns ASAP.",
  "Is there any risk to data integrity here?",
  "Great teamwork on this sprint!"
]

# Store all project objects in an array
projects = [project1, project2, project3, project4, project5, project6]

# Add random comments and status changes to each project
projects.each do |project|
  rand(1..8).times do
    project.comments.create!(body: comments.sample)
  end

  rand(1..8).times do
    project.status_changes.create!(status: statuses.sample)
  end
end
