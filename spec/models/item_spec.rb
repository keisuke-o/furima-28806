require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    
  end

 

  describe '商品出品機能' do
    it "商品名が空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
      
    it "商品説明が空だと登録できない" do
      @item.describe = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Describe can't be blank")
    end

    it "カテゴリーが'--'だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態についての情報が'--'だと登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "配送料の負担が'--'だと登録できない" do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
    end

    it "発送元の地域が'--'だと登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "発送までの日数が'--'だと登録できない" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end

    it "価格が空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
    end

    it "価格が¥300以下だと登録できないこと" do
      @item.price = 290
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が¥9,999,999以上だと登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "販売価格は半角数字のみ入力可能であること" do
      @item.price = "９９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "画像は1枚必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

  end

  describe '商品出品機能' do
    it "全て入力されていれば登録できる" do
      expect(@item).to be_valid
    end
  end
end
