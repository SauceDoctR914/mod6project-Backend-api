# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.new
admin.password = 'bananaKing'
admin.email = "admin@admin.com"
admin.password_confirmation = 'bananaKing'
admin.admin = true
admin.save

newestUser = User.new
newestUser.password = 'banana'
newestUser.email = "newestUser@admin.com"
newestUser.password_confirmation = 'banana'
newestUser.admin = false
newestUser.save

newNotebook = Notebook.new
newNotebook.title = "first book"
newNotebook.user_id = 1
newNotebook.save

newNote = Note.new
newNote.title = "newNote"
newNote.description = "I hope that this works"
newNote.content = "this note is to demonstrate that the note taking interface is working correctly"
newNote.created = "Today"
newNote.notebook_id = 1
newNote.user_id = 1
newNote.save
