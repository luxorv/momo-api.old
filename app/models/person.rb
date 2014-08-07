class Person < Entity
  include Mongoid::Document

  field :lastname, type: String
  field :age, type: Integer

  has_many :animes
  has_many :mangas
end
