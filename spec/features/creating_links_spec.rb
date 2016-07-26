require 'spec_helper'

feature "Creating a Link" do
  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in('title', :with => 'Google')
    fill_in('url', :with => 'http://www.google.com')
    click_button('Submit')
    expect(page).to have_content 'Google'
    expect(page).to have_content 'http://www.google.com'
  end
end
