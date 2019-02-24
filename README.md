# README

Started with running:
  - rails new MyNotes --database=postgresql
  - rake db:setup (because I'm using postgreSQL rather than sqlLite3)

Now the project is ready to start

Next create the controllers:
  - rails g controller home index
  - rails g controller Notes
  - rails g controller Categories

Create the models:
  - rails g model note owner_id:integer title:string body:text category_id:integer
  - rails g model category owner_id:integer name:string description:text

Set routes:
  - resources: :categories, :notes
  - root to:'home#index'

Set associations in models:
  - category.rb:
    - has_many :notes, dependent: :destroy
  - note.rb
    - belongs_to :category
    
Use partial for forms to ensure DRY code
