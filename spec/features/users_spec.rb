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
    visit '/'
    find('.glyphicon-plus').click()

    attr = attributes_for :user
    fill_in_many :user, with: attr
    click_on 'Create User'

    sleep(0.1)
    expect(User.only).to have_attributes attr
    expect(page).to have_content attr[:name]

    find('a', text: attr[:name]).click()
    expect(page).to have_content attr[:name]
    edits = attributes_for :user
    edits[:password] = 'changed'
    fill_many :user, with: edits
    click_on 'Update User'

    sleep(0.1)
    expect(User.only).to have_attributes edits
    expect(page).to have_content edits[:name]

    find('a', text: edits[:name]).click()
    click_on 'Delete'

    sleep(0.1)
    expect(User).to_not exist
    expect(page).not_to have_content edits[:name]
  end

  scenario 'duplicate add' do
    user = create :user
    attr = user.attributes
    visit '#users/new'
    fill_in_many :user, with: attr
    click_on 'Create User'

    sleep(0.1)
    expect(User.only).to have_attributes attr
    expect(page).to have_selector('a', text: user.name, count: 1)
  end

  scenario 'create without password' do
    visit '/'
    find('.glyphicon-plus').click()
    attr = attributes_for :user
    attr.delete(:password)
    fill_in_many :user, with: attr

    expect(page).to_not have_button('Create User')
  end

  scenario 'update without password' do
    user = create :user
    attr = user.attributes
    edits = attributes_for :user
    edits.delete(:password)
    visit '/'
    find('a', text: user.name).click()
    fill_many :user, with: edits
    click_on 'Update User'

    sleep(0.1)
    expect(User.only).to have_attributes edits.merge({ password: attr["password"] })
  end
end