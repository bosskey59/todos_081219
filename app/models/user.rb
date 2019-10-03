class User < ActiveRecord::Base
    has_secure_password
    has_many :todos
    validates :email, uniqueness: true

    # def password=(password)
    #     @password = password

    #     set the password_digest attribute
    # end 

end