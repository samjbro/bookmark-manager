require 'spec_helper'


feature "Viewing links" do
  scenario 'on loading the application links are shown' do
    Link.create(url: 'http://www.google.co.uk', title: 'Google')

    visit '/links'
    expect(page).to have_content 'http://www.google.co.uk'

  end
end
