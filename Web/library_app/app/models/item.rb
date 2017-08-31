class Item < ActiveRecord::Base
  belongs_to :authors

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
