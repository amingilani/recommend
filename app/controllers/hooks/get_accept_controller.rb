# frozen_string_literal: true
class Hooks::GetAcceptController < ApplicationController
  def notification
    event = request.body.read
    r = Recommendation.find_by slug: event['document']['external_id']
    r.update(signature_date: event['document']['external_id'])
  end
end
