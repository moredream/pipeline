class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :labs, through: :categorizations

  def self.tokens(query)

    categories = where("lower(name) like ?", "%#{query}%")
    # if categories.empty?
    #   [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    # else
    #   categories
    # end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end

end
