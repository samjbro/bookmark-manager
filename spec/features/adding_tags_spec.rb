feature 'Adding tags to links' do
  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'www.instagram.com'
    fill_in 'title', with: 'Instagram'
    fill_in 'tag', with: 'social pictures'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('social', 'pictures')
  end
end