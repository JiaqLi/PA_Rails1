class SearchController < ApplicationController
  def index
  end

  def result
    @courses = Course.search(params[:search])
  end
end
