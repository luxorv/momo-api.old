class Episode
  include Mongoid::Document
  field :name, type: String
  field :number, type: Float
  #Episode type (OVA,NAE)
  field :type, type: String
  field :synopsis, type: String
  field :length, type: Time
  field :urls, type: Array
  field :release_date, type: Date
  field :season, type: Integer
  field :popularity, type: Float

  validates :name, allow_nil: false, allow_blank: false, presence: true
  validates :number, allow_nil: false, allow_blank: false, presence: true

  # field :anime, type: Anime


  belongs_to :anime

end
