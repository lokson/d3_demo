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
    expect(User).to_not exist

    # new
    attr = attributes_for :user
    fill_in_many :user, with: attr
    click_on 'Create User'
    expect(User.only).to have_attributes attr

    # index
    expect(page).to have_content attr[:name]

    # edit
    find('a', text: attr[:name]).click()
    expect(page).to have_content attr[:name]
    edits = attributes_for :user
    fill_many :user, with: edits
    click_on 'Update User'
    expect(User.only).to have_attributes edits

    # index
    expect(page).to have_content edits[:name]

    # delete
    find('a', text: edits[:name]).click()
    click_on 'Delete'
    expect(User).to_not exist

    # index
    expect(page).not_to have_content edits[:name]
  end

  scenario 'duplicate add' do
    user = create :user
    attr = user.attributes
    visit '#users/new'
    fill_in_many :user, with: attr
    click_on 'Create User'
    expect(page).to have_selector('a', text: user.name, count: 1)
    expect(User.only).to have_attributes attr
  end
end