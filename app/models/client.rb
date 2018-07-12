class Client < ApplicationRecord

  has_many :boats
  has_many :invoices
  before_save :downcase_email

  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :phone,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  def name
    [first_name, last_name].join(' ')
  end

  def phone=(val)
    super(val.gsub(/[^0-9]/, ""))
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
