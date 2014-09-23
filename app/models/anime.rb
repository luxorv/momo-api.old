#
# Anime: Contains Information on Anime as appears on WikiPedia.
# Properties: :Director, :genres(genre array), :studio, :licenses(company that licensed array), :network,
# :english_network, :start_run_date, :end_run_date, :episodes, :manga, :film
# search_in :brand, :name, :tags => :name, :category => :name, :info => [:summary, :description]
#

class Anime < Entity
  include Mongoid::Document
  include Mongoid::Search

  # validations
  validates :name, allow_nil: false, allow_blank: false, presence: true
  validates :description, allow_nil: false, allow_blank: false, presence: true


  field :name, type: String
  field :director, type: Person
  field :studio, type: Studio
  field :network, type: Network
  field :english_network, type: Network
  field :start_run_date, type: Date
  field :end_run_date, type: Date
  field :episodes, type: Array
  field :manga, type: Manga

  # Prequels and Sequels of Anime
  field :sequels, type: Array
  field :prequels, type: Array

  field :licenses, type: String
  field :films, type: Entity

  belongs_to :director, :class_name => 'Person'
  belongs_to :studio
  belongs_to :network
  belongs_to :english_network, :class_name => 'Network'
  belongs_to :manga
  has_many :licenses, :class_name => 'Producer'
  has_many :films, :class_name => 'Entity'
  has_many :episodes
  has_and_belongs_to_many :sequels, :class_name => 'Anime'
  has_and_belongs_to_many :prequels, :class_name => 'Anime'
  has_and_belongs_to_many :genres

  # has_and_belongs_to_many :otakus, inverse_of: 'watch_list'
  # has_and_belongs_to_many :otakus, inverse_of: 'watching_list'
  # has_and_belongs_to_many :otakus, inverse_of: 'watched_list'

  search_in :name
end
