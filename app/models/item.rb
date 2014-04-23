class Item < ActiveRecord::Base

  has_many :line_items

  validates :title, presence: true,
                    uniqueness: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
  validates :description, presence: true
end
