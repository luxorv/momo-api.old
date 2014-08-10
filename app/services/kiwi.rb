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
end
