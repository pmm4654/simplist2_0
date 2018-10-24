FactoryBot.define do
  factory :item do
    title { "Item title #{rand(123)}" }
    list
  end
end
