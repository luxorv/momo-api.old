class Studio < Entity
  include Mongoid::Document
  field :industry, type: String
  field :website, type: String
  field :founded, type: Date

  has_many :animes
end
