class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :email, :message => "Email address has already been taken"

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
