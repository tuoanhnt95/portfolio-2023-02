class UserMailer < ApplicationMailer
    default from: 'notification@example.com'

    # def welcome_email
    #     @user = params[:user]
    #     @url = 'http://example.com/login'
    #     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    # end

    def contact(contact)
      @contact = params[:contact]
      @name = contact.name
      @email = contact.email
      @subject = contact.subject
      @message = contact.message
      contact_params = {
        :sender => contact.name,
        :from => contact.email,
        :to => 'myspamvn@yahoo.com',
        :subject => contact.subject,
        :message => contact.message
      }
      mail(to: @email, subject: @subject)
    end
end
