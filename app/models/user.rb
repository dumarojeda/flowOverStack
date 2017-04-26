class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :uniqueness => true, :format => {:with => /\A\b[A-Z0-9\.\_\%\-\+]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,6}\b\z/i}
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  validates :password, presence: true


  def login
  user = User.find_for_authentication(email: login_params[:email])

  if user.valid_password?(login_params[:password])
    user.remember_me = login_params[:remember_me]
    sign_in_and_redirect(user, event: :authentication)
  end
end

private
def login_params
  params.require(:user).permit(:email, :password, :remember_me)
end
end
