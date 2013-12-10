class ScdrCounterController < ApplicationController

  def index
    begin
      if params[:start_date].blank? and params[:search_scdr_filename].blank?
        @date = DateTime.now.beginning_of_week
        flash.now[:notice] = "Default to current week."
      elsif params[:start_date].blank?
        filedate = ScdrCounter.get_date(params[:search_scdr_filename])
        @date = Date.parse(filedate.to_s).beginning_of_week
      else
        @date = Date.parse(params[:start_date]).beginning_of_week
      end
    rescue
      flash[:error] = "Invalid date. " + params[:start_date].to_s
      redirect_to(:action => 'index')
      return
    end

    @current_week = @date.strftime("%U").to_i

    filename = params[:search_scdr_filename]
    @daily_counters = ScdrCounter.by_day(@date, @date.end_of_week, filename)
    @hourly_counters = ScdrCounter.by_hour(@date, @date.end_of_week, filename)
    @file_counters = ScdrCounter.by_file(@date, @date.end_of_week, filename)
  end

end
