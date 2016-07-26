feature 'Viewing links' do
  # As a time-pressed user
  # So that I can quickly go to web sites I regularly visit
  # I would like to see a list of links on the homepage
  scenario 'I can see a list of links on the page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within '#ul_links' do
      expect(page).to have_content "Makers Academy"
    end

  end



end