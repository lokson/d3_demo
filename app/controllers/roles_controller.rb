class RolesController < ApplicationController
  @model = Role
  include ElementsController

  def element_params
    params.require(param_key).permit :name, :view_id
  end
end