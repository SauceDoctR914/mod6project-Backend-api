  class UserSerializer < ActiveModel::Serializer
    attributes :email
    has_many :notebooks
    has_many :notes, through: :notebooks
  end
