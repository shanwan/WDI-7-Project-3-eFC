class Ward < ApplicationRecord
  validates :hospital,
  presence: true,
  uniqueness: {case_sensitive: false},

  validates :ward_type,
  presence: true,

  validates :availability,
  length: { in: 8..72 }

  def self.find_and_authenticate_user(params)
    User.find_by_personal_id(params[:personal_id]).try(:authenticate, params[:password])
  end
end
