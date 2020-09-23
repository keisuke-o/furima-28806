require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入機能' do
    it "クレジットカード情報が正しく入力されていないと購入できない" do
      @item_order.token = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end

    it "配送先の地域が'--'だと登録できない" do
      @item_order.prefecture_id = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture is not a number")
    end

    it "住所が正しく入力されていないと購入できない" do
      @item_order.adress = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Adress can't be blank")
    end

    it "郵便番号に'-'が含まれていないと購入できない" do
      @item_order.zip_code = 3334444
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Zip code is invalid")
    end

    it "郵便番号が正しく入力されていないと購入できない" do
      @item_order.zip_code = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid")
    end

    it "電話番号が正しく入力されていないと購入できない" do
      @item_order.telephone = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Telephone can't be blank", "Telephone is invalid")
    end

    it "電話番号に'-'が入力されていると購入できない" do
      @item_order.telephone = 010-2222-3333
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Telephone is invalid")
    end
  end

  describe '商品購入機能' do
    it "全て入力されていれば購入できる" do
      expect(@item_order).to be_valid
    end
  end

end