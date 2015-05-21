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
    # index
    visit '/#roles'
    find('.glyphicon-plus').click()
    expect(Role).to_not exist

    # new
    new = attributes_for :role
    fill_in_many :role, with: new
    click_on 'Create Role'
    expect(Role.only).to have_attributes new

    # index
    expect(page).to have_content new[:name]

    # edit
    f(:a, new[:name]).click()
    expect(page).to have_content Role.first.name
    edits = attributes_for :role
    fill_many :role, with: edits
    click_on 'Update Role'
    expect(Role.only).to have_attributes edits

    # index
    expect(page).to have_content edits[:name]

    # delete
    f(:a, edits[:name]).click()
    click_on 'Delete'
    expect(Role).to_not exist

    # index
    expect(page).not_to have_content edits[:name]
  end
end