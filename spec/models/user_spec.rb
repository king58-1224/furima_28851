require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは@を含む必要があること" do
      @user.email = "xxxxxx@@@.co.jp"
      @user.valid?
      expect(@user.errors.full_messages[0]).to include("is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは6文字以上であること" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英数字混合であること" do
      @user.password = "12345678"
      @user.valid?
      
      expect(@user.errors.full_messages[0]).to include("Password Password can't be blank.")
    end
    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名の名字が必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name First name is invalid. Input full-width characters.")
    end
    it "ユーザー本名の名前が必須であること" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name Family name is invalid. Input full-width characters.")
    end
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = "king"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name First name is invalid. Input full-width characters.")
    end
    it "ユーザー本名のフリガナの名字が必須であること" do
      @user.first_name_kana = "king"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana First name kana is invalid. Input full-width katakana characters..")
    end
    it "ユーザー本名のフリガナの名前必須であること" do
      @user.family_name_kana = "king"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Family name kana is invalid. Input full-width katakana characters.")
    end
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.first_name_kana = "king"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana First name kana is invalid. Input full-width katakana characters..")
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
