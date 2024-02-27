# Blog Post Application
##### Welcome to the Blog Post Application! The BlogPost application is a simple web application built with Ruby on Rails that allows users to create, read, update, and delete blog posts. It also provides features for users to leave comments on blog posts.

## Features
- Devise for Authentication
- CRUD for blogpost
- Update or delete comments on a blog post in real-time using Turbo Streams and Turbo Frames with Hotwire.
- Will Paginate gem for pagination
- Rich Text Area for blog content(https://guides.rubyonrails.org/action_text_overview.html)
- Tailwind CSS for designing

## Getting Started
To run the BlogPost application locally, follow these steps:

- Clone the Repository
- Install Ruby 3.3.0 and Rails 7.1.3
- Install MYSQL and update username and password in config/database.yml file
- Run following commands from terminal
```sh
# Install libvips library to works attachment locally. https://www.libvips.org/install.html
sudo apt install libvips
bundle install
rails db:create
rails db:migrate
# Start the server
./bin/dev
```
- Open browser and visit http://localhost:3000 to access the running application locally.
