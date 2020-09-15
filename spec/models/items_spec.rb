require 'rails_helper'

RSpec.describe Items, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 

describe '商品出品機能' do
  it "商品名が空だと登録できない" do
    @items.name = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("name can't be blank")
  end
    
  it "商品説明が空だと登録できない" do
    @items.describe = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("describe can't be blank")
  end

  it "カテゴリーが空だと登録できない" do
    @items.category = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("Nickname can't be blank")
  end

  it "商品の状態についての情報が空だと登録できない" do
    @items.condition = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("condition can't be blank")
  end

  it "配送料の負担が空だと登録できない" do
    @items.shipping = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("shipping can't be blank")
  end

  it "発送元の地域が空だと登録できない" do
    @items.prefecture = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("prefecture can't be blank")
  end

  it "発送までの日数が空だと登録できない" do
    @items.delivery_day = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("delivery-day can't be blank")
  end

  it "価格が空だと登録できない" do
    @items.price = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("price can't be blank")
  end

  it "価格が¥300以下だと登録できないこと" do
    @items.price = "299"
    @items.valid?
    expect(@items.errors.full_messages).to include("price can't be blank")
  end

  it "価格が¥9,999,999以上だと登録できないこと" do
    @items.price = "10000000"
    @items.valid?
    expect(@items.errors.full_messages).to include("price can't be blank")
  end

  it "販売価格は半角数字のみ入力可能であること" do
    @items.price = "９９９９"
    @items.valid?
    expect(@items.errors.full_messages).to include("price can't be blank")
  end

  it  " 画像は1枚必須であること" do
    @items.image = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("image can't be blank")
  end

end



