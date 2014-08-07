class Manga
  include Mongoid::Document
  field :writer, type: Person
  field :publisher, type: Entity
  field :english_publisher, type: Entity
  field :magazine, type: Entity
  field :start_run_date, type: Date
  field :end_run_date, type: Date
  field :volumes, type: Integer
end
