class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            redirect_to root_path
        else
            render :new
        end
    end
end
