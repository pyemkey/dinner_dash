# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    cart nil
    item nil
    quantity 1
    price "9.99"
  end
end
