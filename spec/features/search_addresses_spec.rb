require 'rails_helper'

feature "SearchAddresses", :type => :feature, :js => true do
  it "signs me in" do
    visit root_path

    fill_in('Street address', with: '10823 Maplecrest lane')
    fill_in('Zip', with: '20854')
    sleep 2
    click_button('Submit')

    assert page.has_content?("WalkScore")
    assert page.has_content?("Last Sold Price =")
  end
end
