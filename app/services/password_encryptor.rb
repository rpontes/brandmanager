# PORO => Plain Old Ruby Objects
class PasswordEncryptor
  def self.encryptor
    Digest::SHA1
  end

  def self.generate_salt(seed = Time.now)
    encryptor.hexdigest(seed.to_s)
  end

  def self.encrypt(password, salt)
    encryptor.hexdigest("--#{salt}--#{password}--")
  end

  def self.generate_hash_and_salt(user, password)
    salt = generate_salt
    hash = encrypt(password, salt)

    user.password_salt = salt
    user.password_hash = hash
  end
end
