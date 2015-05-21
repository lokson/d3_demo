require 'rails_helper'

feature 'users', js: true do
  scenario 'search' do
    create_pair :user

    visit '/'
    expect(page).to have_content User.first.name
    expect(page).to have_content User.second.name

    fill_in "keywords", with: User.first.name
    expect(page).to have_content User.first.name
    expect(page).not_to have_content User.second.name
  end

  scenario 'crud' do
    # index
    visit '/'
    find('.glyphicon-plus').click()

    # new
    new = attributes_for :user
    fill_in_many :user, with: new
    click_on 'Create User'

    # index
    expect(page).to have_content new[:name]

    # edit
    f(new[:name]).click()
    expect(page).to have_content User.first.name
    edits = attributes_for :user
    fill_many :user, with: edits
    click_on 'Update User'

    # index
    expect(page).to have_content edits[:name]

    # delete
    f(edits[:name]).click()
    click_on 'Delete'

    # index
    expect(page).not_to have_content edits[:name]
  end
end