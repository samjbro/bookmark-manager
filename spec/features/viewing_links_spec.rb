# require 'spec_helper'

feature 'Viewing links' do
  scenario 'I can see a list of links on the page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within '#ul_links' do
      expect(page).to have_content "Makers Academy"
    end

  end
end
