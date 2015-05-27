class RolesController < ApplicationController
  @model = Role
  include ElementsController

  def element_params
    params.require(:element).permit :name, :view_id, [subgroup_ids: []]
  end
end