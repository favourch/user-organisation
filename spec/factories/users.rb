FactoryGirl.define do
  factory :user do
    sequence(:login) do |n|
      surname = Faker::Name.last_name.gsub(/[^a-zA-Z]+/, '-').downcase
      "#{('a'..'z').to_a.sample}#{surname}#{n}"
    end

    password { Faker::Lorem.words(3).join }
    email { "#{login}@#{Faker::Internet.domain_name}" }
    website { email.gsub(/\A(.+)@(.+)\z/, 'http://www.\2/~\1') }
  end
end
