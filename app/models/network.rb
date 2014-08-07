class Network < Entity
  include Mongoid::Document
  field :region, type: String

  has_many :animes
end
