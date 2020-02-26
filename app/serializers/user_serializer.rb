  class UserSerializer < ActiveModel::Serializer
    attributes :email, :id
    has_many :notebooks
    has_many :notes, through: :notebooks
  end
