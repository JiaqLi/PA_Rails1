class SearchController < ApplicationController
  protect_from_forgery except: :do_search
  #????????

  def index
    @courses = Course.all.map {|c| [c.subject_id, c.id]}
    @courses = [["All", 0]] + @courses
  end

  def do_search
    @courses = Course.search(params)

    respond_to do |format|
      format.js
    end

  end

end
