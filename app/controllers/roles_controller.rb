class RolesController < ApplicationController
  def self.model; Role end
  include ElementsController

  def element_params
    params.require(param_key).permit :name
  end
end