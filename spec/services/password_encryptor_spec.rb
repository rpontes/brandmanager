# require "spec_helper"
require "./app/services/password_encryptor"
require "digest/sha1"

describe PasswordEncryptor do
  it "uses SHA1 as default encryptor" do
    expect(PasswordEncryptor.encryptor).to eql(Digest::SHA1)
  end

  context "password encryption" do
    let(:encryptor) { mock("encryptor") }

    before do
      PasswordEncryptor.stub(:encryptor => encryptor)
    end

    it "encrypts password" do
      encryptor
        .should_receive(:hexdigest)
        .with("--salt--password--")

      PasswordEncryptor.encrypt("password", "salt")
    end

    it "returns hashed password" do
      encryptor.stub :hexdigest => "hashed"
      hashed = PasswordEncryptor.encrypt("password", "salt")

      expect(hashed).to eql("hashed")
    end
  end

  context "generates salt" do
    let(:seed) { mock("seed", :to_s => "some seed") }
    let(:encryptor) { mock("encryptor") }

    before do
      PasswordEncryptor.stub(:encryptor => encryptor)
    end

    it "generates seed" do
      encryptor
        .should_receive(:hexdigest)
        .with("some seed")

      PasswordEncryptor.generate_salt(seed)
    end

    it "returns salt" do
      encryptor.stub :hexdigest => "some salt"
      salt = PasswordEncryptor.generate_salt(seed)

      expect(salt).to eql("some salt")
    end
  end

  context "generating hash and salt" do
    let(:user) { mock("user").as_null_object }

    before do
      PasswordEncryptor.stub({
        :generate_salt => "salt",
        :encrypt => nil
      })
    end

    it "encrypts password" do
      PasswordEncryptor
        .should_receive(:encrypt)
        .with("password", "salt")

      PasswordEncryptor
        .generate_hash_and_salt(user, "password")
    end

    it "sets password salt" do
      user.should_receive(:password_salt=).with("salt")

      PasswordEncryptor
        .generate_hash_and_salt(user, "password")
    end

    it "sets password salt" do
      user.should_receive(:password_salt=).with("salt")

      PasswordEncryptor
        .generate_hash_and_salt(user, "password")
    end

    it "sets password hash" do
      PasswordEncryptor.stub :encrypt => "hashed"
      user.should_receive(:password_hash=).with("hashed")

      PasswordEncryptor
        .generate_hash_and_salt(user, "password")
    end
  end
end
