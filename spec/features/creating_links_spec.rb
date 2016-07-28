feature 'Creating Links' do
  scenario 'provides the user with a form which allows them to add a new link to the list' do
    visit '/links/new'
    fill_in('title',with: "Facebook")
    fill_in('url',with: "www.facebook.com")
    click_button "Submit"
    expect(page).to have_content "Facebook"
    expect(page).to have_content "www.facebook.com"
  end

end