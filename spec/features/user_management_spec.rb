feature 'User management' do
  scenario 'a new user is able to sign up' do
    sign_up
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, sam@email.com!"
    user = User.first
    expect(user.email).to eq('sam@email.com')
  end

  scenario 'does not create a new user if password does not match confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end