require 'spec_helper'

describe "Users" do
  describe "signup" do
  	describe "failure" do

	    it "should not make a new user" do
	    	lambda do
		      visit signup_path
		      fill_in "Name",                  :with => ""
		      fill_in "Email",                 :with => ""
		      fill_in "Password",              :with => ""
		      fill_in "Password Confirmation", :with => ""
		      click_button
		      response.should render_template('users/new')
		      response.should have_selector("div#error_explanation")
		    end.should_not change(User, :count)
	    end
	  end

	  describe "success" do

	    it "should make a new user" do
	    	lambda do
		      visit signup_path
		      fill_in "Name",                  :with => "Bandit Rodriguez"
		      fill_in "Email",                 :with => "bandit@msn.com"
		      fill_in "Password",              :with => "bandit11"
		      fill_in "Password Confirmation", :with => "bandit11"
		      click_button
		      response.should have_selector("div.flash.success", :content => 'Welcome to the Sample App!')
		      response.should render_template('users/show')
		    end.should change(User, :count).by(1)
	    end
	  end
  end
end
