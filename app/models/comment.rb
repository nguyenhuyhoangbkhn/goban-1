# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  user_id    :integer
#  hotel_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string(255)
#

class Comment < ApplicationRecord
  mount_uploader :picture, AttachmentUploader
  belongs_to :hotel, optional: true
  belongs_to :user, optional: true
  validates :content,:user_id, :hotel_id, presence: true
end
