class Guru < ActiveRecord::Base
    belongs_to :user, inverse_of: :guru

    def guru?
      true
    end

    def become_guru(user)
      user.build_guru!
    end

end
