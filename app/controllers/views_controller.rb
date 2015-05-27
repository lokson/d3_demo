class ViewsController < ApplicationController
  @model = View
  include ElementsController

  def element_params
    # params.require(param_key).permit :name
  end
end