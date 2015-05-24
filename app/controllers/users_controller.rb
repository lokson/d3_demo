class UsersController < ApplicationController
  @model = User
  include ElementsController

  def element_params
    params.require(param_key).permit :name, :password, :role_id
  end
end