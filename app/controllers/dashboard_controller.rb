class DashboardController < ApplicationController
  before_action :authenticate_staff!

  def index
    @recommendations = Recommendation.all
  end
end
