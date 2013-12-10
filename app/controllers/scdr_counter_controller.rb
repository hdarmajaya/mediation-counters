class ScdrCounterController < ApplicationController

  def index
    @date = DateTime.now.beginning_of_week
    @current_week = @date.strftime("%U").to_i
    filename = ''
    @daily_counters = ScdrCounter.by_day(@date, @date.end_of_week, filename)
    @hourly_counters = ScdrCounter.by_hour(@date, @date.end_of_week, filename)
    @file_counters = ScdrCounter.by_file(@date, @date.end_of_week, filename)
  end

end
