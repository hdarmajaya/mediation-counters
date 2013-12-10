class DashboardController < ApplicationController

  def home
    @gcdr_success_percentage = 90
    @gcdr_fail_percentage = 10

    @scdr_success_percentage = 80
    @scdr_fail_percentage = 20
  end

end
