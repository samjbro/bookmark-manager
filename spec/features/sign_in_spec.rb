feature 'sign in' do
  scenario 'user sign in' do
    visit '/users/sign_up'

    fill_in :email, with: 'bob@email.com'
    fill_in :password, with: '12345'
    #Why does this syntax work?
    expect{ click_button 'Submit' }.to change(User, :count).by 1
    expect(page).to have_content "Hello  bob@email.com!"
    expect(User.first.email).to eq 'bob@email.com'
  end
end