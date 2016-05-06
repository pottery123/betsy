class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def create
  #   merchant = Merchant.find_by_userName(params[:userName])

  #   if merchant && merchant.authenticate(params[:password])
  #       merchant_session[:merchant_id] = merchant.id
  #       redirect_to root_url, :notice => "Merchanthas been logged in"
  #   else
  #       flash.now[:error] = "Invalid username or password."
  #       @title  = "Merchant Signin"
  #       render "new"
  #   end
  # end




  private

  def user_create_params
    params.permit(user: [:user_name, :email, :password, :password_confirmation])
  end
end
