class Cat < ActiveRecord::Base
  belongs_to :cafe, optional: true
  belongs_to :breed, optional: true
end
