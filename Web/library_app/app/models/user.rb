class User < ActiveRecord::Base
  validates :fname, presence: true, length: { maximum: 50 }
  validates :lname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }
  has_secure_password
  belongs_to :role

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end



  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
