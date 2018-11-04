class Cat < ActiveRecord::Base
  belongs_to :cafe, optional: true
  belongs_to :breed, optional: true

  scope :search_by_prefecture, ->(prefecture_code) {
    return self if prefecture_code.blank?
    Cat.joins(:cafe).where(cafes: {prefecture: prefecture_code})
  }

  scope :search_by_breed, ->(breed_id) {
    return self if breed_id.blank?
    where(breed: breed_id)
  }

  def age(birthday)
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
