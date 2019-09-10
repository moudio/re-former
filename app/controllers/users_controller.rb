# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = 'User updated!'
      redirect_to edit_user_path
    else
      render action: :edit
    end
  end

  def show; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
