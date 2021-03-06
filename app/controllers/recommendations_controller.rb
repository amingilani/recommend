# frozen_string_literal: true
## The magical place where recommendations happen
## https://recommend.gilani.me
class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: %i(show deliver done edit update)

  def new
    @recommendation = Recommendation.new(
      body:            File.read(Rails.root + 'lib/template-letter.txt'),
      address_country: 'US'
    )
  end

  def create
    @recommendation = Recommendation.new recommendation_params
    if @recommendation.save
      flash[:notice] = 'New recommendation created! Please review and sign.'
      return redirect_to @recommendation
    end
    flash[:error] = @recommendation.errors.full_messages.join(', ')
    redirect_to new_recommendation_path(@recommendation)
  end

  def show
    respond_to do |format|
      format.html
      format.pdf { render pdf: "recommendation-#{@recommendation.slug}" }
    end
  end

  def deliver
    SendForSignatureJob.perform_later @recommendation
    redirect_to done_recommendation_path(@recommendation)
  end

  def done; end

  def edit; end

  def update
    if @recommendation.update(recommendation_params)
      flash[:notice] = 'Recommendation updated! Please review and sign.'
    else
      flash[:error] = @recommendation.errors.full_messages.join(', ')
    end
    redirect_to @recommendation
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find_by slug: params[:slug]
  end

  def recommendation_params
    form_attributes = %i( first_name last_name email phone_number fax_number
                          organization position body address_line_1 address_line_2
                          address_city address_state address_zip
                          address_country )
    params.require(:recommendation).permit(*form_attributes)
  end
end
