class User < ApplicationRecord
    has_many :borrowings, dependent: :destroy
  
    before_destroy :check_borrowings
    has_secure_password 
    private
  
    def check_borrowings
      if borrowings.exists?
        errors.add(:base, "Cannot delete user with active borrowings.")
        throw(:abort)
      end
    end
  end
  