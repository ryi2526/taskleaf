class ApplicationController < ActionController::Base
    # CSRF有効
    protect_from_forgery with: :exception
    # CSRF無効
    #protect_from_forgery with: :null_session

    # ヘルパー　current_userを使用可能にする
    helper_method :current_user

    # サインインしているか調べる
    before_action :signin_required
    

    private

    def current_user
        # セッションの情報を格納する
        @current_user ||= User.find_by(UserID: session[:UserID]) if session[:UserID]
        
    end

    def signin_required
        redirect_to signin_path unless current_user
    end

end
