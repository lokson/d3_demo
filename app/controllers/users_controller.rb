class UsersController < ApplicationController
  def self.model; User end
  include ElementsController

  def element_params
    params.require(param_key).permit :name, :password
  end
end