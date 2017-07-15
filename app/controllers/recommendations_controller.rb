class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new(
      body: File.read(Rails.root + 'lib/template-letter.txt'),
      address_country: 'US'
    )
  end

  def create
    @recommendation = Recommendation.new recommendation_params
    if @recommendation.save
      flash[:notice] = 'Email sent! please check your inbox to sign the recommendation!'
      return redirect_to @recommendation
    end
    flash[:error] = @recommendation.errors.full_messages.join(", ")
    redirect_to new_recommendation_path(@recommendation)
  end

  def show
    @recommendation = Recommendation.find_by slug: params[:slug]
    respond_to do |format|
      format.html
      format.pdf { render pdf: "recommendation-#{@recommendation.slug}" }
    end
  end

  private

  def recommendation_params
    form_attributes = %i( name email phone_number fax_number organization
                          position body address_line_1 address_line_2
                          address_city address_state address_zip
                          address_country )
    params.require(:recommendation).permit(*form_attributes)
  end
end
