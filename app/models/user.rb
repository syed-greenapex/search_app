class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
end
