class Genre < Entity
  include Mongoid::Document

  has_and_belongs_to_many :animes

end
