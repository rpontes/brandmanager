class Signup
  def self.process(user, mailer = Mailer)
    mailer.welcome(user).deliver
  end
end
