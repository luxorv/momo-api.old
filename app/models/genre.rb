class Genre < Entity
  include Mongoid::Document

  # field :animes, type: Array
  has_and_belongs_to_many :animes

end
