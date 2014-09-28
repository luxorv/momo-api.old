class AnimeRate
  include Mongoid::Document
  field :value, type: Integer

  belongs_to :otaku
  belongs_to :anime

end
