class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password], params[:remember])

    if @user
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end

  def new
  end
end
