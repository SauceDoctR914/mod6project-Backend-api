class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id
  belongs_to :user
  has_many :notes
end
