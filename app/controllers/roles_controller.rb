class RolesController < ApplicationController
  @model = Role
  include ElementsController

  def element_params
    result = params.require(:element).permit :name, :view_id, [subgroup_ids: []]
    result["subgroup_ids"] ||= []
    result
  end
end