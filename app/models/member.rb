class Member < ActiveRecord::Base
  has_one :user, as: :membership, dependent: :destroy

  def mentee?
    false
  end



  def grade
    "Mentor"
  end

end
