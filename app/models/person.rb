class Person < Entity
  include Mongoid::Document

  field :lastname, type: String
  field :age, type: Integer
end
