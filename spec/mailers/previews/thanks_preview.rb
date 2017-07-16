# Preview all emails at http://localhost:3000/rails/mailers/thanks
class ThanksPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/thanks/thank_you
  def thank_you
    ThanksMailer.thank_you
  end

end
