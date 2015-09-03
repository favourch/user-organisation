FactoryGirl.define do
  factory :organization do
    name { Faker::Company.name }
    contact_name { Faker::Name.name }
    contact_mail { Faker::Internet.email(contact_name) }
  end
end
