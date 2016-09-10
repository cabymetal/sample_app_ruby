class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    @user.file_url="dummy"          # because not created the upload yet
    if @user.save
      log_in @user
      flash[:success] = "User Created"
      redirect_to @user
      
    else
      render 'new'
    end
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
