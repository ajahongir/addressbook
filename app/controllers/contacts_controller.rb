class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
      render :new
    end
  end

  def show
    @contact = Contact.find params[:id]
    respond_with @contact
  end

  def destroy
    contact = Contact.find params[:id]
    contact.destroy
    redirect_to contacts_path
  end

  def update
    @contact = Contact.find params[:id]
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def edit
    @contact = Contact.find params[:id]
  end

  def new
    @contact = Contact.new
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phones, :emails)
  end
end
