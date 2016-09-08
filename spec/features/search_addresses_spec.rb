require 'rails_helper'

feature "SearchAddresses", :type => :feature, :js => true do
  it "search basic address" do
    visit root_path

    fill_in('Street address', with: '10823 Maplecrest lane')
    fill_in('Zip', with: '20854')
    # sleep 2
    click_button('Submit')


    sleep 3
    within ".house-info" do
      assert page.has_content?("Last Sold Price =")
    end

    within ".walkscore" do
      assert page.has_content?("WalkScore")
    end
    sleep 3
  end
end

feature "SignUpUser", :type => :feature, :js => true do
  it "sign up repeated email" do
    visit new_user_registration_path

    fill_in('Email', with: '1@1@gmail.com')
    fill_in('Password', with: 'clai88')
    fill_in('Password confirmation', with: 'clai88')

    click_button('Sign Up')

    assert page.has_content?("Email has already been taken")
    sleep 4
  end
end

feature "SignInUser", :type => :feature, :js => true do
  it "sign up unconfirmed email" do
    visit new_user_session_path

    fill_in('Email', with: 'clai88@gmail.com')
    fill_in('Password', with: 'clai88')

    click_button('Log In')
    assert page.has_content?("You have to confirm your email address before continuing.")

  end
end
