class Cafe < ActiveRecord::Base
  has_many :cats
  self.table_name = "cafes"
end
