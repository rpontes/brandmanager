# require "spec_helper"
require "./app/services/authenticator"

describe Authenticator do
  let(:repository) { mock("repository").as_null_object }
  let(:encryptor) { mock("encryptor").as_null_object }
  let(:user) {
    mock("user",
      :password_hash => "hash",
      :password_salt => "salt"
    )
  }

  it "finds user by its e-mail" do
    repository
      .should_receive(:find_by_email)
      .with("john@example.org")

    Authenticator
      .authenticate("john@example.org", "test", repository, encryptor)
  end

  it "returns nil when providing invalid e-mail" do
    repository.stub :find_by_email
    result = Authenticator
      .authenticate("john@example.org", "test", repository, encryptor)

    expect(result).to be_nil
  end

  it "hashes password" do
    repository.stub :find_by_email => user
    encryptor
      .should_receive(:encrypt)
      .with("test", "salt")

    Authenticator
      .authenticate("john@example.org", "test", repository, encryptor)
  end

  it "returns user when password is valid" do
    repository.stub :find_by_email => user
    encryptor.stub :encrypt => "hash"

    result = Authenticator
      .authenticate("john@example.org", "test", repository, encryptor)

    expect(result).to eql(user)
  end

  it "returns nil when password is invalid" do
    repository.stub :find_by_email => user
    encryptor.stub :encrypt => "another hash"

    result = Authenticator
      .authenticate("john@example.org", "test", repository, encryptor)

    expect(result).to be_nil
  end
end
