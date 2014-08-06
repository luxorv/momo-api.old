class Anime
  include Mongoid::Document
  field :name, type: String
  field :category, type: String
  field :released, type: Date
end
