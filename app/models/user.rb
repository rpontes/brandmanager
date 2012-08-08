class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :name, :password, :password_confirmation
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A.+@.+\Z/
  validates_uniqueness_of :email

  def password=(password)
    PasswordEncryptor.generate_hash_and_salt(self, password)
    @password = password
  end
end
