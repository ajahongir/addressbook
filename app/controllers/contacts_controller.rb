class ContactsController < InheritedResources::Base
  respond_to :html, :json

  def index
    @contacts = Contact.all
  end

  def create
    resource = Contact.new contact_params
    if resource.save
      redirect_to contact_path(resource)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    resource.destroy
    redirect_to contacts_path
  end

  def update
    if resource.update(contact_params)
      redirect_to contact_path(resource)
    else
      render :edit
    end
  end

  def edit
  end

  def new
    @contact = Contact.new
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phones, :emails)
  end
end
