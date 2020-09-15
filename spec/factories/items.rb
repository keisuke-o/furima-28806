FactoryBot.define do
  factory :item do
    name              {"あああ"}
    describe          {"あああ"}
    category          {"レディース"}
    condition         {"未使用"}
    shipping          {"着払い（購入者負担）"}
    prefecture        {"千葉県"}
    delivery_day      {"1日〜２日で発送"}
    price             {"4000"} 
    image   {image.attach(io: File.open('/path/to/file'), filename: 'camera.pnp')}
    
    association :user 
  end
end
