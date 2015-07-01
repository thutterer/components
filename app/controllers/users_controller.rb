class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(role_id: params['user']['role_id'].to_i)
      flash[:success] = "Rolle erfolgreich geaendert."
    else
      flash[:info] = "Could not change Role."
    end
    redirect_to action: 'index'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User Deleted"
    redirect_to users_path
  end
  private

  def user_params
    params.require(:user).permit(:role_id)
  end

end
