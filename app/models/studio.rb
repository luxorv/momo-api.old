class Studio
  include Mongoid::Document
  field :industry, type: String
  field :website, type: String
  field :founded, type: Date
end
