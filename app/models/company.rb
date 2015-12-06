# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  email             :string           not null
#  name              :string           not null
#  location          :string           default("Everywhere")
#  desc              :string
#  website           :string
#  public_email      :boolean          default(FALSE), not null
#  password_digest   :string           not null
#  salt_front        :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  remember_token    :string
#

class Company < ActiveRecord::Base
  has_secure_password
  has_attached_file :logo, styles: {
    medium: '300x300>',
    thumb: '100x100>'
  }, default_url: '/images/:style/missing.png'

  validates :name, :email, :password_digest, presence: true
  validates_with AttachmentSizeValidator, attributes: :logo, less_than: 1.megabytes
  validates_attachment_content_type :logo, content_type: %r{\Aimage\/.*\Z}

  after_initialize :init
  before_save { |company| company.email.downcase!}
  before_save :create_remember_token

  def init
    self.salt_front = BCrypt::Engine.generate_salt
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
