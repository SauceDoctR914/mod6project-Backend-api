class User < ApplicationRecord
  has_secure_password
  has_many :notebooks
  has_many :notes, through: :notebooks
end

# u = User.create(username: "guy", password: "guybro")
# n = Notebook.create(title: "guybook", user_id: 1)
# no = Note.create(title: "guynote", notebook: n)
