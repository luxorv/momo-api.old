=begin

  Pusher class: this class is used as a database transactions-handler abstraction module.
  This class handles User Actions and Features that requires to push a transaction to the DB.

  Uses: x class.

  - This class will be injected in some method for the controllers that require it.
  - Redirect required GET/PUT/POST/DELETE methods controllers to Pusher Module

=end

class Pusher

  def self.create_anime attrs
    # binding.pry
    anime = Anime.new(attrs)
    anime.save
    anime
  end
end
