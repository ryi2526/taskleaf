class Local::UsersController < ApplicationController
  # CSRF対策からcreateアクションを除外
  protect_from_forgery except: :create 


  # usersテーブルに登録する（サインアップ画面）
  def new
    # Userモデルを使用してuserインスタンスを作成する 
    @user = User.new
  end

  # /userがpostされたらユーザを作成する
  def create
    # HTMLから受けとったパラメータをuser_paramsに送る
    @user = User.new(user_params)

    # 入力したパスワードが一致しなかった場合
    if @user.password != @user.password_confirmation
      flash.now[:notice] = "パスワードが一致しません"
      render :new
    
    # 入力したUserIDがすでに使われている場合
    elsif User.where(UserID: @user.UserID).present? then
      flash.now[:notice] = "「#{@user.UserID}」はすでに使われています"
      render :new
    
    # 入力項目が正しい場合
    else 
      # userインスタンスを登録
      @user.save!
      flash.now[:notice] = "ユーザ「#{@user.UserID}」を登録しました。"
      redirect_to local_user_path(@user.UserID)
    end
  end

  def index
  end

  # 編集用の画面
  def edit
    @user = User.find_by(UserID: current_user.UserID)
  end

  # ユーザの更新処理
  def update
    # サインインしているユーザのUserIDを検索する
    user = User.find_by(UserID: current_user.UserID)
    # フォームからパラメータを受け取り更新する
    user.update(useredit_params)
    redirect_to local_users_path
  end

  def show
    # 受け取ったUserIDを検索する
    @user = User.find_by(UserID: params[:UserID])
  end


  
  # privateの下からは private action
  private
  
  # userインスタンスのパラメータ（column）を指定する
  def user_params
    # 受け取ったパラメータをcolumnに追加する
    params.require(:user).permit(:UserID, :UserName, :password, :password_confirmation)
  end

  def useredit_params
    # 受け取ったパラメータをcolumnに追加する
    params.require(:user).permit(current_user.UserID, :UserName)
  end

end
