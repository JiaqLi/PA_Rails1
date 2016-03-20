class Course < ActiveRecord::Base
  def self.search(search)
    if search
        where("name LIKE ?", "%#{search}%")
    else
      self.all
    end

  end

end
