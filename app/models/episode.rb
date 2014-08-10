class Episode
  include Mongoid::Document
  field :name, type: String
  field :number, type: Float
  #Episode type (OVA,NAE)
  field :type, type: String
  field :synopsis, type: String
  field :length, type: Time
  field :urls, type: String
  field :release_date, type: Date
  field :season, type: Integer
  field :popularity, type: Float

  # field :anime, type: Anime


  belongs_to :anime

end
