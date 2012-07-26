module Spree
  class InquiryMailer < ActionMailer::Base
    default :from => Spree::MailMethod.current.preferred_mails_from

    def notification(inquiry, customer = false)
      @inquiry = inquiry

      recipients = Spree::MailMethod.current.preferred_intercept_email || Spree::MailMethod.current.preferred_mail_bcc.split()

      mail(
        :to => customer ? inquiry.email : recipients,
        :subject => "#{Spree::Config[:site_name]} #{I18n.t(:contact_form)}: #{@inquiry.inquiry_type}",
        :reply_to => customer ? Spree::MailMethod.current.preferred_mails_from : inquiry.email,
        :bcc => ''
      )
    end
  end
end