class Authenticator
  def self.authenticate(email, password, repository = User, encryptor = PasswordEncryptor)
    user = repository.find_by_email(email)

    return unless user

    actual_hash = encryptor.encrypt(password, user.password_salt)

    user if user.password_hash == actual_hash
  end
end
