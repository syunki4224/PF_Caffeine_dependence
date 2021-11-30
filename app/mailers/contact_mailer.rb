class ContactMailer < ApplicationMailer

  def contact_mail(contact)
      @contact = contact
      mail to: 'syunkikoike4224@gmail.com', subject: 'お問い合わせ内容'
  end

end
