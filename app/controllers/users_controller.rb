class UsersController < ApplicationController
  expose :users
  expose :user, attributes: :user_params

  def create
    user.save!
    render partial:'user'
  end

  def update
    user.save!
    render partial:'user'
  end

  def destroy
    user.destroy!
    head 200
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end