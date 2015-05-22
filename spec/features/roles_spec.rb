require 'rails_helper'

feature 'roles', js: true do
  scenario 'search' do
    create_pair :role
    visit '/#roles'

    expect(page).to have_content Role.first.name
    expect(page).to have_content Role.second.name

    fill_in "keywords", with: Role.first.name

    expect(page).to have_content Role.first.name
    expect(page).not_to have_content Role.second.name
  end

  scenario 'crud' do
    visit '/#roles'
    find('.glyphicon-plus').click()
    attr = attributes_for :role
    fill_in_many :role, with: attr
    click_on 'Create Role'

    sleep(0.1)
    expect(Role.only).to have_attributes attr
    expect(page).to have_content attr[:name]

    find('a', text: attr[:name]).click()
    expect(page).to have_content attr[:name]
    edits = attributes_for :role
    fill_many :role, with: edits
    click_on 'Update Role'

    sleep(0.1)
    expect(Role.only).to have_attributes edits
    expect(page).to have_content edits[:name]

    find('a', text: edits[:name]).click()
    click_on 'Delete'

    sleep(0.1)
    expect(Role).to_not exist
    expect(page).not_to have_content edits[:name]
  end
end