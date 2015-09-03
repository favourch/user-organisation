class Organization < ActiveRecord::Base
  validates :contact_mail,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
            on: :create
end
