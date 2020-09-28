class Item < ApplicationRecord
  belong_to :user
  has_one_attached :image

  with_options presence: true do
    validates  :name           
    validates  :price,                   
    validates  :information  

                  


end
