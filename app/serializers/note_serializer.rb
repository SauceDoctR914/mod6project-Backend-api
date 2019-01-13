class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content, :created, :notebook_id, :user_id
  belongs_to :notebook
  belongs_to :user
end
