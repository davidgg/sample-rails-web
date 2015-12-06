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

require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:comp) { FactoryGirl.build(:company) }

  it 'should create a valid company' do
    expect(comp).to be
  end

  it 'inits front salt' do
    expect(comp.salt_front).to be
  end
end
