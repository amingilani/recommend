require Rails.root.join('app','services', 'get_accept_service.rb')
class SendForSignatureJob < ApplicationJob
  queue_as :default

  def perform(r)
    GetAcceptService.instance.send_for_signature(r)
  end
end
