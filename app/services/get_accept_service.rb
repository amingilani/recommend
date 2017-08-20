# frozen_string_literal: true

class GetAcceptService
  include Singleton

  def initialize
    set_api
  end

  def send_for_signature(r)
    return Rails.logger 'sent to sign for #{r.first_name}' unless Rails.env.production?
    begin
      res = @api.document.create('name':                 'Recommending Amin Gilani',
                                 'external_id':          r.slug,
                                 'file_content':         Base64.encode64(r.to_pdf),
                                 'type':                 'other',
                                 'recipients':           [recepient_data(r)],
                                 'is_signing':           true,
                                 'is_signing_biometric': true,
                                 'is_reminder_sending':  true,
                                 'is_signing_forward':   false,
                                 'is_sms_sending':       false,
                                 'is_automatic_sending': true)
    rescue GetAccept::RequestError => e
      Rails.logger "Get Accept Error: #{e.response_body}"
      set_api
      send_for_signature(r)
    end
    r.update(signature_id: res['id'])
  end

  private

  def recepient_data(r)
    data = {
      'email':      r.email,
      'first_name': r.first_name,
      'last_name':  r.last_name,
      'role':       'signer',
      'order_num':  0
    }
    if r.phone_number_formatted.present?
      data['mobile'] = r.phone_number_formatted
      data['verify_sms'] = true
      data['verify_sms_sign'] = true
    end
    data
  end

  def set_api
    @token = GetAccept::Api.get_token(
      email: 	  Rails.application.secrets[:getaccept_username],
      password: Rails.application.secrets[:getaccept_password]
    ).parse['access_token']
    @api = GetAccept::Api.new token: @token
  end
end
