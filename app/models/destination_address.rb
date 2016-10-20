# == Schema Information
#
# Table name: destination_addresses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  village_id :integer
#  address    :string(255)
#  hotel_id   :integer
#  user_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DestinationAddress < ApplicationRecord
  belongs_to :village
  belongs_to :hotel
end
