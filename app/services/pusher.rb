=begin

  Pusher class: this class is used as a database transactions-handler abstraction module.
  This class handles User Actions and Features that requires to push a transaction to the DB.

  Uses: x class.

  - This class will be injected in some method for the controllers that require it.
  - Redirect required GET/PUT/POST/DELETE methods controllers to Pusher Module

=end

class Pusher

  def self.create_anime attrs
    anime = Anime.new(attrs)
    anime.save
    anime
  end

  def self.update_anime params
    anime = Finder.find_anime_by_id(params[:id]).first
    anime.update_attributes params[:anime]
    anime
  end

  def self.destroy_anime params
    @anime = Finder.find_anime_by_id(params[:id]).first
    @anime.destroy
  end
end
