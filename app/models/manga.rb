class Manga
  include Mongoid::Document

  field :name, type: String
  field :writer, type: Person
  field :publisher, type: Entity
  field :english_publisher, type: Entity
  field :magazine, type: Entity
  field :start_run_date, type: Date
  field :end_run_date, type: Date
  field :volumes, type: Integer

  belongs_to :writer, :class_name => "Person"
  belongs_to :publisher, :class_name => "Entity"
  belongs_to :english_publisher, :class_name => "Entity"
  belongs_to :magazine, :class_name => "Entity"
end
