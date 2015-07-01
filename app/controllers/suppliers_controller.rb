class SuppliersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]

  def index
    @suppliers = Supplier.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @supplier = Supplier.new
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update(supplier_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    redirect_to suppliers_path
  end

  private
  def supplier_params
    params.require(:supplier).permit(:title)
  end

end
