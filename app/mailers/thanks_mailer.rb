# frozen_string_literal: true
class ThanksMailer < ApplicationMailer
  def thank_you(r=nil)
    @r = r || Recommendation.first

    mail to:      @r.email,
         subject: 'Thank you',
         from:    'amin@gilani.me'
  end
end
