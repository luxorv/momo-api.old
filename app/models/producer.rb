class Producer < Entity
  include Mongoid::Document
  field :type, type: String
  field :website, type: String


  # attr_readonly :anime_id
end
