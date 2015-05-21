class UsersController < ApplicationController
  expose :users
  expose :user, attributes: :user_params

  def create
    user.save!
    render user
  end

  def update
    user.save!
    render user
  end

  def destroy
    user.destroy!
    head 200
  end

  def user_params
    params.require(:user).permit :name
  end
end