feature 'Creating Links' do
  before do
    visit '/links/new'
    fill_in('title', with: "Facebook")
    fill_in('url', with: "www.facebook.com")
  end

  scenario 'provides the user with a form which allows them to add a new link to the list' do
    click_button "Submit"
    expect(page).to have_content "Facebook"
    expect(page).to have_content "www.facebook.com"
  end

  scenario 'allows user to add a tag to the new link' do
    fill_in('tag', with: 'social')
    click_button "Submit"
    link = Link.first
    expect(link.tags.map(&:name)).to include("social")
  end

end