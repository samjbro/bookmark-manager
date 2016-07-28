def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  # fill_in('username', with: 'Sam')
  fill_in('email', with: 'sam@email.com')
  fill_in('password', with: '4pple5')
  click_button 'Sign up'
end

