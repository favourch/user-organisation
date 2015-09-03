[User, Organization].each(&:delete_all)

i = 0
count = lambda do |a|
  i += Array(a).length
  print("\rCreating Objects: #{i}\e[0K")
end

FactoryGirl.define { after(:create) { count.call(1) } }

include FactoryGirl::Syntax::Methods

ActiveRecord::Base.transaction do
  create(:user, login: 'admin', password: 'password')
  create_list(:user, 1000)
  create_list(:organization, 1000)
end

puts
