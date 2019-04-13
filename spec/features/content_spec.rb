require 'rails_helper'

feature 'content', type: :feature do
  let(:user) { create(:user) }

  scenario 'post content' do
    # ログイン前には投稿ボタンがない
    visit root_path
    expect(page).to have_no_selector 'svg[data-icon=dumbbell]'
  end

  # scenario 'ログインする' do
  #   visit new_user_session_path
  #   fill_in 'user_email', with: user.email
  #   fill_in 'user_password', with: user.password
  #   click_on 'ログイン'
  #   binding.pry
  #   expect(current_path).to eq root_path
  #   expect(page).to have_selector 'svg[data-icon=dumbbell]'
  # end
end