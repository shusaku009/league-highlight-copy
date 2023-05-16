class UserSessionsController < ApplicationController
  def new; end

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_back_or_to '/', success: 'ログインしました'
    else
      flash.now[:error] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, error: 'ログアウトしました', stauts: :see_other
  end
end
