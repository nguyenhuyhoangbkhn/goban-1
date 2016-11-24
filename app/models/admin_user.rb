# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  address                :string(255)
#  tel                    :string(255)
#  bio                    :string(255)
#  job                    :string(255)
#  edu                    :string(255)
#  name                   :string(255)
#  birthday               :datetime
#  role                   :integer
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class AdminUser < ApplicationRecord
  extend Devise::Models

  enum role: [:mod, :admin]
  after_initialize :set_default_role, if: :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments,
    reject_if: :all_blank, allow_destroy: true
  has_one :avatar, as: :attachable, dependent: :destroy
  validates :avatar, presence: true
  accepts_nested_attributes_for :avatar

  before_validation :not_assign_password_with_blank, on: :update

  def not_assign_password_with_blank
    self.password = password.presence
    self.password_confirmation = password_confirmation.presence
  end

  def set_default_role
    self.role ||= :mod
  end
end
