class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!

  def show
    @user = current_user
  end
end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to your_profile_path, notice: "Datos actualizados correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def authorize_user!
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end