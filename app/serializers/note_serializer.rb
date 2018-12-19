class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content, :created
end
