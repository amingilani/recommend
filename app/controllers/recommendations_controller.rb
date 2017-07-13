class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new(
    body: File.read(Rails.root + 'lib/template-letter.txt'),
    address_country: 'US'
    )
  end
end
