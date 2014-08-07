class Entity
  include Mongoid::Document
  field :name, type: String
  field :entity_type, type: String
  field :description, type: String
end
