# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  picture            :string(255)
#  attachable_id      :integer
#  attachable_type    :string(255)
#

class Attachment < ApplicationRecord
  mount_uploader :picture, AttachmentUploader
  belongs_to :attachable, polymorphic: true, optional: true
end
