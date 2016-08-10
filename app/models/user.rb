class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :user_name, presence: true, length: {minimum: 4, maximum: 16}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
