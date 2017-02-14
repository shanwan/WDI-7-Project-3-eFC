class User < ApplicationRecord
  has_one :patient
  
  validates :personal_id,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: /\A[STFG]\d{7}[A-Z]\z/

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password,
  length: { in: 8..72 },
  on: :create

  validates :name,
  presence: true

  validates :contact_no,
  presence: true,
  numericality: true,
  length: { :minimum => 8, :maximum => 8 }

  has_secure_password

  def self.find_and_authenticate_user(params)
    User.find_by_personal_id(params[:personal_id]).try(:authenticate, params[:password])
  end
end
