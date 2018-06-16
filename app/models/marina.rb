class Marina < ApplicationRecord
  has_many :boats

  def display_address
    "#{address1}, #{city} #{state}"
  end
end
