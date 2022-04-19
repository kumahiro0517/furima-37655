require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase = FactoryBot.build(:purchase_address)
    end

    context '商品購入できる場合' do
      it 'token,post_code,region_id,municipalities,address_number,phone_numberが存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'tokenが空では購入できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'region_idが空では購入できない' do
        @purchase.region_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Region can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @purchase.municipalities = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'address_numberが空では購入できない' do
        @purchase.address_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeはハイフンがないと購入できない' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_numberは半角数値以外では購入できない' do
        @purchase.phone_number = '090-3333-9999'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it 'region_idが1では購入できない' do
        @purchase.region_id = '1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Region must be other than 1")
      end
    end
  end
end