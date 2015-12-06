FactoryGirl.define do
  sequence :email do |n|
    "company#{n}@example.com"
  end

  sequence :name do |n|
    "email#{n}@example.com"
  end

  factory :company do
    email
    name
    password 'password'
    public_email true
  end
end
