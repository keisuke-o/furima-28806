FactoryBot.define do
  factory :item do
    name              {"あああ"}
    describe          {"あああ"}
    category_id          {2}
    condition_id         {2}
    shipping_id          {2}
    prefecture_id        {12}
    delivery_day_id      {2}
    price             {4000} 
    
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/IMG_4935.jpeg'), filename: 'IMG_4935.jpeg')
    end
  end
end
