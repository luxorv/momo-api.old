=begin

  KiWi class: this class is used as a database querying abstraction module,
  with this class you can find anything on the system.

  Uses: x class.

  - This class will be injected in show method for all controllers.
  - Redirect GET method controllers to Kiwi Module

=end

class KiWi


  def self.show_anime id
    Anime.find(id)
  end

  def self.show_entity id
    Entity.find(id)
  end

  def self.show_episode id
    Episode.find(id)
  end

  def self.show_genre id
    Genre.find(id)
  end

  def self.show_manga id
    Manga.find(id)
  end

  def self.show_network id
    Network.find(id)
  end

  def self.show_person id
    Person.find(id)
  end

  def self.show_producer id
    Producer.find(id)
  end

  def self.show_studio id
    Studio.find(id)
  end


end
