class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_item(item_id)
    current_item = line_items.find_by(item_id: item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item_id)
      current_item.price = current_item.item.price
    end
    current_item
  end

  def remove_item(item_id)
    current_item = line_items.find_by(item_id: item_id)
    if current_item
      if current_item.quantity > 1
        current_item.quantity -= 1
        current_item.save
      else
        current_item.delete
      end
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end
end
