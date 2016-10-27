# == Schema Information
#
# Table name: hotels
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  countRoom     :integer
#  introduction  :text(65535)
#  hotel_kind    :integer
#  phone_number  :string(255)
#  website       :string(255)
#  score_average :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Hotel < ApplicationRecord
  has_many :attachments, inverse_of: :hotel
  has_many :comments, inverse_of: :hotel
  has_many :destination_addresses, inverse_of: :hotel

  accepts_nested_attributes_for :destination_addresses,
    reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :attachments, :comments,
    reject_if: :all_blank, allow_destroy: true
end
