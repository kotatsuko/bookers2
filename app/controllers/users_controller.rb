class UsersController < ApplicationController

  def index
    @user=current_user
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @books=Book.where(user_id:@user.id)
  end

  def edit
  end


end
