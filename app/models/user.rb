class User < ApplicationRecord
# bcryptをインストールして使用できるようになる　
    has_secure_password

    # 不完全なデータを排除する
    # presence 入力させるかどうか, uniquness:keyかどうか
    validates :UserID, presence: true, uniqueness: true
    validates :UserName, presence: true
    validates :password_digest, presence: true
end
