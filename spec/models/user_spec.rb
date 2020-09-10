require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全ての項目の入力が存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは@を含む必要がある" do
      @user.email = "test1234"
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameがない場合は登録できないこと" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors[:family_name]).to include("can't be blank")
    end
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end
    it "family_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("can't be blank")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "birth_dayがない場合は登録できないこと" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors[:birth_date]).to include("can't be blank")
    end
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.family_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("is invalid")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("is invalid")
    end
  end
end
