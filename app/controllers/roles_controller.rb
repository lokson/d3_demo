class RolesController < ApplicationController
  expose :roles
  expose :role, attributes: :role_params

  def create
    role.save!
    render partial:'role'
  end

  def update
    role.save!
    render partial:'role'
  end

  def destroy
    role.destroy!
    head 200
  end

  def role_params
    params.require(:role).permit :name
  end
end