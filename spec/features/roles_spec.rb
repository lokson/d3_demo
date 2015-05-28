require 'rails_helper'

feature 'roles', js: true do
  let(:model) { Role }

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



  scenario 'happy crud' do
    view_a = create :view
    view_b = create :view

    visit index_path
    click_css '.glyphicon-plus'
    fill_in_many model, with: data_a
    select view_a.name
    click_on "Create #{model}"
    wait

    expect(model.only).to have_attributes data_a
    expect(model.only.view.id).to eq view_a.id
    expect(page).to have_content data_a[:name]

    click_a data_a[:name]
    fill_many model, with: data_b
    select view_b.name
    click_on "Update #{model}"
    wait

    expect(model.only).to have_attributes data_b
    expect(model.only.view.id).to eq view_b.id
    expect(page).to have_content data_b[:name]

    click_a data_b[:name]
    click_on 'Delete'
    wait

    expect(User).to_not exist
    expect(page).not_to have_content data_b[:name]
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

  scenario 'create, duplicate name' do
    element = create model
    view = create :view
    visit new_path
    data_a[:name] = element.name
    fill_in_many model, with: data_a
    select view.name
    click_on "Create #{model}"
    wait

    expect(model.only).to have_attributes element.attributes
    expect(page).to have_selector('a', text: element.name, count: 1)
  end

  scenario 'create, no view' do
    create :view
    visit new_path
    fill_in_many model, with: data_a

    expect(page).to_not have_button "Create #{model}"
  end


  scenario 'delete, with users' do
    user = create :user
    element = user.role
    visit edit_path element.id
    click_on 'Delete'
    wait

    expect(model.only).to have_attributes element.attributes
    expect(User).to exist
  end

  scenario 'update, subgroup happy crud' do
    element = create model
    view_a = View.last
    view_b = create :view
    subgroup_a = create :subgroup
    subgroup_b = create :subgroup
    view_a.groups << subgroup_a.group
    view_a.groups << subgroup_b.group
    view_b.groups << subgroup_a.group
    view_b.groups << subgroup_b.group
    element.subgroups << subgroup_a

    visit edit_path element.id
    fill_many model, with: data_a
    select view_a.name
    find('.subgroup', text: subgroup_b.name).click
    click_on "Update #{model}"
    wait

    expect(model.only).to have_attributes data_a
    expect(model.only.subgroup_ids).to match [subgroup_a.id, subgroup_b.id]

    visit edit_path element.id
    find('.subgroup', text: subgroup_b.name).click
    click_on "Update #{model}"
    wait

    expect(model.only).to have_attributes data_a
    expect(model.only.subgroup_ids).to match [subgroup_a.id]

    visit edit_path element.id
    select view_b.name
    click_on "Update #{model}"
    wait

    expect(model.only).to have_attributes data_a
    expect(model.only.subgroup_ids).to match []
  end
end