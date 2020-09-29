class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image
  
  
  validate :image_presence
   def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  with_options presence: true do
    validates  :name         
    validates  :price, format: { with: /\A^[0-9]+$\z/, message: 'Price Half-width number'}     
    validates  :price, :numericality => {
                       :greater_than_or_equal_to => 300,
                       :less_than_or_equal_to => 9999999,
                       :message => 'Price Out of setting range' }
    validates  :information
    validates  :area_id
    validates  :category_id
    validates  :delivery_fee_id
    validates  :shipping_date_id
    validates  :status_id
  end

    with_options numericality: { other_than: 1 }  do
      validates  :area_id
      validates  :category_id
      validates  :delivery_fee_id
      validates  :shipping_date_id 
      validates  :status_id
    end
end
                  



