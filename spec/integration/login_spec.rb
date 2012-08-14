# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Login" do
  context "with valid credentials" do
    let(:user) do
      User.create!({
        :name => "John Doe",
        :email => "john@example.org",
        :password => "test",
        :password_confirmation => "test"
      })
    end

    before do
      visit "/"
      click_link "Acessar minha conta"

      fill_in "Seu e-mail", :with => user.email
      fill_in "Sua senha", :with => "test"
      click_button "Acessar minha conta"
    end

    it "redirects to the home page" do
      expect(current_path).to eql(root_path)
    end

    it "displays welcome message" do
      expect(page).to have_content("Olá, John Doe")
    end
  end

  context "with invalid credentials" do
    before do
      visit "/"
      click_link "Acessar minha conta"
      click_button "Acessar minha conta"
    end

    it "renders login page" do
      expect(current_path).to eql(login_path)
    end

    it "displays error message" do
      expect(page).to have_content("E-mail/senha inválidos")
    end
  end
end
