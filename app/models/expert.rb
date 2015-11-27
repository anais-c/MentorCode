class Expert < ActiveRecord::Base

  before_save {self.email = email.downcase}

  validates :firstname, presence: true, length: { minimum: 3, maximum: 40 }
  validates :lastname, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 
  validates :location, presence: true
  validates :experience, presence: true, length: { minimum: 3, maximum: 600 }  

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def Expert.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
