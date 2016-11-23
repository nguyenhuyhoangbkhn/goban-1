# == Schema Information
#
# Table name: hotels
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  countRoom     :integer
#  introduction  :text(65535)
#  phone_number  :string(255)
#  website       :string(255)
#  score_average :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  price         :integer
#  hotel_kind    :string(255)
#

class Hotel < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :destination_addresses, dependent: :destroy
  has_many :rate_hotels, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :destination_addresses, :rate_hotels,
    reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :attachments, :comments, :reviews,
    reject_if: :all_blank, allow_destroy: true

  validates :name, :price, presence: true
  validates :reviews, presence: true
  scope :highest_rated, -> {includes(:reviews).group('hotel_id').order('AVG(reviews.rating) ASC')}
  def avg_rate
    reviews.map{|review| review&.rating}.sum / reviews.length
  end
end
