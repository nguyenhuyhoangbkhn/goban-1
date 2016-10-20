# == Schema Information
#
# Table name: districts
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  ordinate      :string(255)
#  district_kind :integer
#  provincial_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_districts_on_provincial_id  (provincial_id)
#

class District < ApplicationRecord
  belongs_to :provincial
  has_many :villages, inverse_of: :district
end
