class Entity
  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :entity_type, type: String
  field :description, type: String

  scope :films, where(entity_type: :film)

  # validations
  validates :name, allow_nil: false, allow_blank: false, presence: true
  validates :description, allow_nil: false, allow_blank: false, presence: true

  before_create :set_entity_type

  def set_entity_type
    self.entity_type = self.class.name if self.class.name != "Entity"
  end

  belongs_to :anime, inverse_of: "films"
  has_many :mangas, inverse_of: "publisher"
  has_many :mangas, inverse_of: "english_publisher"
  has_many :mangas, inverse_of: "magazine"

  search_in :name

end
