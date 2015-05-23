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



  scenario 'crud' do
    visit index_path
    click_css '.glyphicon-plus'
    fill_in_many model, with: data_a
    click_on "Create #{model}"
    wait

    expect(model.only).to have_attributes data_a
    expect(page).to have_content data_a[:name]

    click_a data_a[:name]
    fill_many model, with: data_b
    click_on "Update #{model}"
    wait

    expect(model.only).to have_attributes data_b
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
end