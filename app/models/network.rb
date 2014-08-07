class Network < Entity
  include Mongoid::Document
  field :region, type: String
end
