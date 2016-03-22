class EnrollmentsController < ApplicationController

  def enroll
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(course_id: params[:course_id], user_id: params[:user_id])
    #db_attr: params[:something]
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to root_path, notice: 'Successfully Enrolled!' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end
end
