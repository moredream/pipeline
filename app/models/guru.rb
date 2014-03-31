class Guru < ActiveRecord::Base
    belongs_to :user, inverse_of: :guru
  	validates :name, presence: true
  	validates :user_id, uniqueness: true, presence: true

    def guru?
      true
    end

    def become_guru(user)
      user.build_guru!
    end

end
