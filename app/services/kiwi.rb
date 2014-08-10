=begin

  KiWi class: this class is used as a database querying abstraction module,
  with this class you can find anything on the system.

  Uses: x class.

=end

class KiWi

  def self.anime_with_name_like name
    anime = Anime.all.where(name: name)
    anime
  end
end
