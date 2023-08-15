FactoryBot.define do
  factory :item do
    item_name           {Faker::Lorem.sentence}
    description_item    {Faker::Lorem.sentence}
    category_id         {2}
    condition_id        {2}
    shipping_charges_id {2}
    region_id           {2}
    number_of_day_id    {2}
    price               {500}
    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
