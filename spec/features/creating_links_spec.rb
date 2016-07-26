feature 'save a website' do
  scenario 'add site address and title to bookmark manager' do
    visit('/links/new')
    fill_in('title', with: 'Launch Academy')
    fill_in('url', with: 'http://www.launchacademy.com')
    click_button('Create Link')

    expect(current_path).to eq('/links')

    within 'ul#links' do
      expect(page).to have_content('Launch Academy')
    end

  end
end
