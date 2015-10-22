class ContactsController < InheritedResources::Base
  respond_to :html, :json

  def index
    @contacts = Contact.all
  end

  def create
    @contact = Contact.new contact_params
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

  def import
    if params[:file].present? && valid_file?
      ImportService.new(params[:file].tempfile).call
    end
    redirect_to root_path
  end

  def export
    send_data ExportService.new.call, filename: 'export.csv'
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phones, :emails)
  end

  def valid_file?
    File.extname(params[:file].tempfile.path) == ".csv"
  end
end
