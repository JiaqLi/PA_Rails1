class SearchController < ApplicationController
  def index
  end

  def result
    @courses = Course.search(params)
    puts @courses
    gets
  end
end
