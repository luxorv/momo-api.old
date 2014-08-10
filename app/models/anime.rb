#
# Anime: Contains Information on Anime as appears on WikiPedia.
# Properties: :Director, :genres(genre array), :studio, :licenses(company that licensed array), :network,
# :english_network, :start_run_date, :end_run_date, :episodes, :manga, :film
# search_in :brand, :name, :tags => :name, :category => :name, :info => [:summary, :description]
#

class Anime
  include Mongoid::Document
  include Mongoid::Search

  field :director, type: Person
  field :studio, type: Studio
  field :network, type: Network
  field :english_network, type: Network
  field :start_run_date, type: Date
  field :end_run_date, type: Date
  field :episodes, type: Array
  field :manga, type: Manga

  field :licenses, type: String
  field :films, type: Entity

  belongs_to :director, :class_name => "Person"
  belongs_to :studio
  belongs_to :network
  belongs_to :english_network, :class_name => "Network"
  belongs_to :manga
  has_many :licenses, :class_name => "Producer"
  has_many :films, :class_name => "Entity"
  has_many :episodes
  # has_many :episodes

  search :name
end