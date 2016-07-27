require 'spec_helper'

feature "Adding tags" do
  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in('url', with: 'http://www.soundcloud.com')
    fill_in('title', with: 'Soundcloud')
    fill_in('tags', with: 'Music')

    click_button('Submit')
    expect(Link.tags.map(&:name)).to include('education')
  end
end
