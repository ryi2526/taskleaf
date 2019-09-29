class SessionsController < ApplicationController
  # CSRF対策からcreateアクションを除外
  protect_from_forgery except: :create 

  def new
  end


  def create

    # userオブジェクトにUserIDを格納する
    user = User.find_by(UserID: session_params[:UserID])

    # パスワード認証が一致していたら
    if user&.authenticate(session_params[:password])
      session[:UserID] = user.UserID
      redirect_to local_users_path, notice: 'ログインしました'
    else
      render :new
    end

  end

  def destroy
    # セッションを削除する
    reset_session
    redirect_to local_users_path, notice: 'ログアウトしました。'
  end

  # privateの下からは private action
  private

  def session_params
    params.require(:session).permit(:UserID, :password)
  end

end
