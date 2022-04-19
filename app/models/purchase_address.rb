class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipalities, :address_number, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :region_id, numericality: {other_than: 1}
    validates :municipalities
    validates :address_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, region_id: region_id, municipalities: municipalities, address_number: address_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end