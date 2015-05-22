class RolesController < ApplicationController
  model = Role
  expose(:model) { model }
  expose :elements, model: model
  expose :element, attributes: :element_params, model: model

  def create
    element.save!
    render partial:'element'
  end

  def update
    element.save!
    render partial:'element'
  end

  def destroy
    element.destroy!
    head 200
  end

  def element_params
    params.require(model.model_name.element).permit :name
  end
end