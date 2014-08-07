class Entity
  include Mongoid::Document
  field :name, type: String
  field :entity_type, type: String
  field :description, type: String


  scope :films, where(entity_type: :film)

  before_create :set_entity_type
  def set_entity_type
    self.entity_type = self.class.name
  end
end
