class Code < ActiveRecord::Base
  belongs_to :offer
  after_create :set_codes_used
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                             format: { with: VALID_EMAIL_REGEX },
                             uniqueness: { case_sensitive: false }

  private
  
  def set_codes_used
    self.offer.increment!(:codes_used)
  end

end


