class Order < ApplicationRecord
  belongs_to :user

  after_create :send_confirmation_email, if: -> { self.user.send_confirmations }

  private

  def send_confirmation_email
    OrderMail.confirmation(user.mail, order).deliver
  end
end
