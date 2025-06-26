# Homey Timeline

A simple Rails application to create projects, add comments, and change status of projects

## Live Demo (Heroku) 
**TODO** - only initial set up done as its a paid service
[https://homey-timeline-demo.herokuapp.com](https://homey-timeline-demo.herokuapp.com)

## GitHub Repository
[https://github.com/Anusha1401/homey-timeline](https://github.com/Anusha1401/homey-timeline)

---

## Features

- Create and list projects
- Comment on projects
- View status changes and comments in a unified timeline
- Clean and minimal UI using Tailwind CSS

---

## Requirements
- Ruby 3.3.x
- Rails 8.0.x
- PostgreSQL

---

# Setup Instructions

## Clone the repository
```bash
git clone https://github.com/Anusha1401/homey-timeline.git
cd homey-timeline
```

# Install dependencies
```bash
bundle install
```
# Set up the database
```bash
rails db:setup
```
# Run the server
```bash
rails server
```