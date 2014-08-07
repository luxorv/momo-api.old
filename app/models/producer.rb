class Producer
  include Mongoid::Document
  field :type, type: String
  field :website, type: String
end
