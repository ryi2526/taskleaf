class Local::UsersController < ApplicationController
  # usersテーブルに登録する（サインアップ画面）
  def new
    # Userモデルを使用してuserインスタンスを作成する 
    @user = User.new
  end

  # /userがpostされたらユーザを作成する
  def create
    # HTMLから受けとったパラメータをuser_paramsに送る
    @user = User.new(user_params)

    # ユーザの作成に成功したとき
    if @user.save
      flash.now[:notice] = "ユーザ「#{@user.UserID}」を登録しました。"
      redirect_to local_user_path(@user.UserID)

    # ユーザの作成に失敗したとき
    else
      # ユーザIDをチェックするためUserIDを探し格納する
      userIDcheck = User.find_by(UserID: params[:UserID])
      # ユーザIDの重複時
      if userIDcheck.nil?
        # ユーザを登録しないでnewに返す
        flash.now[:notice] = "「#{@user.UserID}」はすでに使われています"
        render :new
      else
        render :new
      end
    end

  end

  def index
  end

  def edit
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

end
