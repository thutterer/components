class ComponentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]


  def index
    if params[:search_title]
      @components = Component.search_title(params['search_title']).order(:title).paginate(:per_page => 10, :page => params[:page])
    else
      @components = Component.order(:title).paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @component = Component.find(params[:id])
    @attributes = Attribute.all
    @attribute_values = ComponentAttributeValue.where(component_id: @component.id)
  end

  def new
    @component = Component.new(quantity: 1, invoice: Time.now, warranty: Time.now)
    @components = Component.order(:title)
    @categories = Category.order(:title)
    @rooms = Room.order(:title)
    @suppliers = Supplier.order(:title)
  end

  def edit
    @component = Component.find(params[:id])
    @components = Component.order(:title)
    @categories = Category.order(:title)
    @rooms = Room.order(:title)
    @suppliers = Supplier.order(:title)
    @attributes = Attribute.order(:title)
    @attribute_values = ComponentAttributeValue.where(component_id: @component.id)
  end

  def create
    @component = Component.new(component_params)

    if @component.save
      @component.category.addribude.each do |attribute|
        ComponentAttributeValue.create(component_id: @component.id, attribute_id: attribute.id)
      end
      redirect_to action: 'edit', id: @component.id
      flash[:info] = t('new_component_success')
    else
      @components = Component.order(:title)
      @categories = Category.order(:title)
      @rooms = Room.order(:title)
      @suppliers = Supplier.order(:title)
      render 'new'
    end
  end

  def update
    @component = Component.find(params[:id])

    if @component.update(component_params)
      if defined? params[:values].each
        params[:values].each do |id, attribute_value|
          ComponentAttributeValue.find(id).update(value: attribute_value)
        end
      end
      redirect_to @component
      flash[:info] = t('edit_success')
    else
      @components = Component.order(:title)
      @categories = Category.order(:title)
      @rooms = Room.order(:title)
      @suppliers = Supplier.order(:title)
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
    params.require(:component).permit(:title, :category_id, :room_id, :supplier_id, :quantity, :invoice, :warranty, :component_id)
  end

end
