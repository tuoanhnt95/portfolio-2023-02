class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        UserMailer.contact(@contact).deliver_now
        redirect_to root_path
        # flash[:notice] = "I have received your message and will be in touch within three days!"
      else
        # flash[:notice] = "There was an error sending your message. Please try again."
        render :new, status: :unprocessable_entity
      end
    end

    private

    def contact_params
      params.permit(:name, :email, :subject, :message)
      # require(:contact) cause unclear error. For more details: https://stackoverflow.com/questions/47391168/param-is-missing-or-the-value-is-empty-in-nested-resource-method
    end
end
