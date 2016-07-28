require 'spec_helper'


feature "Viewing links" do
  scenario 'on loading the application links are shown' do
    Link.create(url: 'http://www.google.co.uk', title: 'Google')

    visit '/links'
    expect(page).to have_content 'http://www.google.co.uk'

  end
  scenario 'filtering links by a "bubble" tag' do
    visit 'links/new'
    fill_in('title', :with => 'Google')
    fill_in('url', :with => 'http://www.google.com')
    fill_in('tags', :with => 'bubbles')
    click_button('Submit')
    visit 'links/new'
    fill_in('title', :with => 'Makers')
    fill_in('url', :with => 'http://www.makersacademy.co.uk')
    fill_in('tags', :with => 'makers')
    click_button('Submit')
    visit '/tags/bubbles'
    expect(page).not_to have_content 'http://www.makersacademy.co.uk'
    expect(page).to have_content 'http://www.google.com'
  end
end
