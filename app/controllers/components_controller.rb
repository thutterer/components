class ComponentsController < ApplicationController
  before_filter :authenticate_user!


  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
    @components = Component.all
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
    @categories = Category.all
    @rooms = Room.all
    @suppliers = Supplier.all
  end

  def edit
    @component = Component.find(params[:id])
    @categories = Category.all
    @rooms = Room.all
    @suppliers = Supplier.all
  end

  def create
    #render plain: params[:component].inspect
    @component = Component.new(component_params)

    if @component.save
      redirect_to action: 'index'
    else
      # quick bugfix for last commit.
      #   redirect_to action: 'new' might be better but that doesn't show validation error messages
      @categories = Category.all
      @rooms = Room.all
      @suppliers = Supplier.all
      render 'new'
    end
  end

  def update
    @component = Component.find(params[:id])

    if @component.update(component_params)
      redirect_to action: 'index'
    else
      @categories = Category.all
      @rooms = Room.all
      @suppliers = Supplier.all
      render 'edit'
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    redirect_to components_path
  end


  private
  def component_params
    params.require(:component).permit(:title, :category_id, :room_id, :supplier_id)
  end

end
