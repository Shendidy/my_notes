# README

Started with running:
  - rails new MyNotes --database=postgresql
  - rake db:setup (because I'm using postgreSQL rather than sqlLite3)

Now the project is ready to start

Next create the controllers:
  - rails g controller Posts
  - rails g controller Categories

Create the models:
  - rails g model post owner_id:integer title:string body:text category_id:integer
  - rails g model category owner_id:integer name:string description:text
