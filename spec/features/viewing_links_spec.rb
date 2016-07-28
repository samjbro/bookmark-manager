require 'data_mapper'
require 'dm-postgres-adapter'

feature 'Viewing links' do
  before(:each) do
    Link.create(url: 'www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'educational')])
    Link.create(url: 'www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'social')])
    Link.create(url: 'www.github.com', title: 'Github', tags: [Tag.first_or_create(name: 'educational')])
    Link.create(url: 'www.twitter.com', title: 'Twitter', tags: [Tag.first_or_create(name: 'social')])
  end


  scenario 'I can see existing links on the links page' do
    visit '/links/index'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content "Makers Academy"
    end
  end

  scenario 'I can filter displayed links by their tag' do
    visit '/tags/social'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content "Makers Academy"
      expect(page).to have_content "Facebook"
      expect(page).not_to have_content "Github"
      expect(page).to have_content "Twitter"

    end
  end

end