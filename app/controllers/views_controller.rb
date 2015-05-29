class ViewsController < ApplicationController
  @model = View
  include ElementsController

  def element_params
    params.require(:element).permit :name
  end
end