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

To solve the rails console issue and getting it to start, include this gem in the development part of Gemfile
  - gem 'rb-readline'

Start implementing a user system:
  - Get the latest gem for 'devise' from rubygems.org
  - Now its: gem 'devise', '~> 4.6', '>= 4.6.1'
  - Add to the Gemfile
  - Run bundle install
  - Run the generator: rails generate devise:install
  - Run: rails g devise:views
  - Run: rails g devise User
  - Go to db/migrate/2019xxxx the latest migrate file created and fix to your requirements.
  - Run: rake db:migrate
  - PS. if after the past few steps you get an undefined method error on loading your pages, try disconnecting the server then reconnect.
  - Make sure to update the model .rb files to reflex belongs_to and has_many
  - I needed to use rails g migration rename_column :table, :old_column, :new_column to change in notes owner_id to user_id in both notes and categories tables.
  - In notes controller update new and update methods from @note = Note.new to @note = current_user.notes.build
