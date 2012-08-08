require 'spec_helper'

describe User do
	context "validations" do
		it "accepts valid attibutes" do
			user = User.new({
				:name => "John",
				:email => "john@example.org",
				:password => "test",
				:password_confirmation => "test"
			})

			expect(user).to be_valid
		end
		
		it "requires name to be set" do
			user = User.create(:name => nil)
			expect(user).to have(1).error_on(:name)
		end

		it "requires email to be set" do
			user = User.create(:email => nil)
			expect(user).to have(1).error_on(:email)
		end

		it "requires a valid e-mail address" do
			user = User.create(:email => "invalid")
			expect(user).to have(1).error_on(:email)
		end		

		it "requires password to be set" do
			user = User.create(:password => nil)
			expect(user).to have(1).error_on(:password)
		end

		it "requires password confirmation to be set" do
			user = User.create(:password_confirmation => nil)
			expect(user).to have(1).error_on(:password_confirmation)
		end		

		it "requires password confirmation" do
			user = User.create(
				:password => "test",
				:password_confirmation => "invalid"
			)
			expect(user).to have(1).error_on(:password)
		end
	end
end
