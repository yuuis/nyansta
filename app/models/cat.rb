class Cat < ActiveRecord::Base
  belongs_to :cafe, optional: true
  belongs_to :breed, optional: true

  def age(birthday)
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
