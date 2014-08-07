class Anime
  include Mongoid::Document
  field :director, type: Person
  field :studio, type: String
  field :licenses, type: String
  field :network, type: Entity
  field :english_network, type: Entity
  field :start_run_date, type: Date
  field :end_run_date, type: Date
  field :episodes, type: Integer
  field :manga, type: Manga
  field :film, type: Entity
end
