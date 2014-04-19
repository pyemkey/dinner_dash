class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
  validates :description, presence: true
end
