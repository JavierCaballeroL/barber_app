class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!

  def show
    @user = current_user
  end
end

  private

  def authorize_user!
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end