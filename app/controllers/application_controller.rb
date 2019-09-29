class ApplicationController < ActionController::Base
    # CSRF有効
    protect_from_forgery with: :exception

    # CSRF無効
    #protect_from_forgery with: :null_session
end
