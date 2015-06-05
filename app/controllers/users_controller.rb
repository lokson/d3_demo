class UsersController < ApplicationController
  @model = User
  include ElementsController

  def element_params
    params.require(:element).permit :name, :password, :role_id, :last_login_at, :logins_count
  end
end