class User < ActiveRecord::Base
  def self.authenticate(login, password)
    user = find_by login: login
    user.password[password] && user
  end

  def update_attributes(user)
    update(password: user[:password], login: user[:login])
  end
end
