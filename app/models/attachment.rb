# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  hotel_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Attachment < ApplicationRecord
  belongs_to :hotel
  has_attached_file :image
                  # :url  => "/assets/products/:id/:style/:basename.:extension",
                  # :path => "#{Rails.root}/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
