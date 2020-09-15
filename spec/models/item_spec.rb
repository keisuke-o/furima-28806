require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 

describe '商品出品機能' do
  it "商品名が空だと登録できない" do
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("name can't be blank")
  end
    
  it "商品説明が空だと登録できない" do
    @item.describe = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("describe can't be blank")
  end

  it "カテゴリーが空だと登録できない" do
    @item.category = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Nickname can't be blank")
  end

  it "商品の状態についての情報が空だと登録できない" do
    @item.condition = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("condition can't be blank")
  end

  it "配送料の負担が空だと登録できない" do
    @item.shipping = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("shipping can't be blank")
  end

  it "発送元の地域が空だと登録できない" do
    @item.prefecture = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("prefecture can't be blank")
  end

  it "発送までの日数が空だと登録できない" do
    @item.delivery_day = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("delivery-day can't be blank")
  end

  it "価格が空だと登録できない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("price can't be blank")
  end

  it "価格が¥300以下だと登録できないこと" do
    @item.price = "299"
    @item.valid?
    expect(@item.errors.full_messages).to include("price can't be blank")
  end

  it "価格が¥9,999,999以上だと登録できないこと" do
    @item.price = "10000000"
    @item.valid?
    expect(@item.errors.full_messages).to include("price can't be blank")
  end

  it "販売価格は半角数字のみ入力可能であること" do
    @item.price = "９９９９"
    @item.valid?
    expect(@item.errors.full_messages).to include("price can't be blank")
  end

  it  " 画像は1枚必須であること" do
    @item.image = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("image can't be blank")
  end

end
