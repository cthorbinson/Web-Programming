class Author < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  has_many :items
  before_save { self.name = name.downcase }

    def self.search(query)
      where("name like ?", "%#{query}%")
    end

end
