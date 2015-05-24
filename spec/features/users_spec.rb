require 'rails_helper'

feature 'users', js: true do
  let(:model) { User }

  def index_path
    "/##{model.model_name.route_key}"
  end
  def new_path
    "#{index_path}/new"
  end
  def edit_path(id)
    "#{index_path}/#{id}/edit"
  end

  let(:data_a) { attributes_for model }
  let(:data_b) { attributes_for model }



  scenario 'crud' do
    role_a = create :role
    role_b = create :role
    visit index_path
    click_css '.glyphicon-plus'
    fill_in_many model, with: data_a
    select role_a.name
    click_on "Create #{model}"
    wait

    expect(model.only).to have_attributes data_a
    expect(model.only.role_id).to eq role_a.id
    expect(page).to have_content data_a[:name]

    click_a data_a[:name]
    data_b[:password] = 'changed'
    fill_many model, with: data_b
    select role_b.name
    click_on "Update #{model}"
    wait

    expect(model.only).to have_attributes data_b
    expect(model.only.role_id).to eq role_b.id
    expect(page).to have_content data_b[:name]

    click_a data_b[:name]
    click_on 'Delete'
    wait

    expect(User).to_not exist
    expect(page).not_to have_content data_b[:name]
  end

  scenario 'create, no password' do
    role_a = create :role
    visit new_path
    data_a.delete :password
    fill_in_many model, with: data_a
    select role_a.name

    expect(page).to_not have_button "Create #{model}"
  end

  scenario 'create, no role' do
    role_a = create :role
    visit new_path
    fill_in_many model, with: data_a

    expect(page).to_not have_button "Create #{model}"
  end

  scenario 'create, duplicate name' do
    element = create model
    visit new_path
    data_a[:name] = element.name
    fill_in_many model, with: data_a
    select Role.only.name
    click_on "Create #{model}"
    wait

    expect(model.only).to have_attributes element.attributes
    expect(page).to have_selector('a', text: element.name, count: 1)
  end

  scenario 'update, no password' do
    element = create model
    visit edit_path element.id
    data_a.delete :password
    fill_many model, with: data_a
    click_on 'Update User'
    wait

    expect(model.only).to have_attributes data_a.merge password: element.password
  end

  scenario 'search' do
    create_pair model
    visit index_path

    expect(page).to have_content model.first.name
    expect(page).to have_content model.second.name

    fill_in 'keywords', with: model.first.name

    expect(page).to have_content model.first.name
    expect(page).not_to have_content model.second.name
  end
end