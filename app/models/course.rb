class Course < ActiveRecord::Base
  belongs_to :subject


  #WONDER WHY DOESN'T WORK...     where('name LIKE ?', params[:keywords])

  def self.search(params)
    key = params[:keywords]
    id = params[:subject_id]

    if key.present? && id.present?
      where("name LIKE ? AND subject_id LIKE ?", "%#{key}%", "%#{id}%")
    elsif key.present?
      where("name LIKE ?", "%#{key}%")
    elsif id.present?
      where("subject_id LIKE ?", "%#{id}%")
    else
      self.all
    end
  end

end
