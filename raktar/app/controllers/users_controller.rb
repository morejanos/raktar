class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def index
    @users = User.all
  end

  def show
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Felhasználó sikeresen frissült.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Felhasználó sikeresen törölve lett.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :permission_id, :password, :password_confirmation)
    end
end
