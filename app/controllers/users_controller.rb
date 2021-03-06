class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:destroy]
  before_action :check_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def profile
    @user = current_user
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def check_if_admin
      render text: "Acsess denied", status: 403 unless current_user.admin?
    end

    def check_user
      render text: "Acsess denied", status: 403 unless current_user.id == @user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
