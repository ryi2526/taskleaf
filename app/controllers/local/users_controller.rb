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
    if @user.save!
      redirect_to local_user_path(@user.UserID), notice: "ユーザ「#{@user.UserName}」を登録しました。"

    # ユーザの作成に失敗したとき
    else
      # ユーザを登録しないでnewに返す
      render :new
    end

  end

  def index
  end

  def edit
  end

  def show
    @user = User.find_by(UserID: params[:UserID])
  end

  # privateの下からは private action
  private
  
  # userインスタンスのパラメータ（column）を指定する
  def user_params
    # 
    params.require(:user).permit(:UserID, :UserName, :password, :password_confirmation)
  end

end
