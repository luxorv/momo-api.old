class Episode
  include Mongoid::Document
  field :synopsis, type: String
  field :length, type: Time
  field :urls, type: String
  field :release_date, type: Date
  field :season, type: Integer
  field :popularity, type: Float
end
