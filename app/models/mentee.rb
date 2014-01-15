class Mentee < ActiveRecord::Base
  has_one :user, as: :membership, dependent: :destroy

  def mentee?
    true
  end

  def become_member
    user.membership = Member.new
    user.save!
  end

  def grade
    "Mentee"
  end

private

  def request_member

  end


end
