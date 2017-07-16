# frozen_string_literal: true
class Hooks::GetAcceptController < ApplicationController
  skip_before_action :verify_authenticity_token

  def notification
    r = Recommendation.find_by slug: params['document']['external_id']
    r.update(signature_date: params['document']['sign_date'])
    render json: {success: true, message: 'Okay!'}
  end
end
