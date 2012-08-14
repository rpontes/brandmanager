FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) {|n| "john#{n}@exemple.org"}
    password "test"
    password_confirmation "test"
  end

  factory :client do
    sequence(:name) {|n| "Client #{n}"}
    telephone "4833333333"

  preload do
    factory(:john_doe) {FactoryGirl.create(:user)}
    factory(:company) {FactoryGirl.create(:client, :name => "Company Co", :telephone => "4833333333")}
  end
end