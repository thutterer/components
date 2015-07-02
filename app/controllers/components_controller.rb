class ComponentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]


  def index
    if params[:search_title]
      @components = Component.search_title(params['search_title']).order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
    else
      @components = Component.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @component = Component.find(params[:id])
    @attributes = Attribute.all
    @attribute_values = ComponentAttributeValue.where(component_id: @component.id)
  end

  def new
    @component = Component.new(quantity: 1, invoice: Time.now, warranty: Time.now)
    @categories = Category.all
    @rooms = Room.all
    @suppliers = Supplier.all
  end

  def edit
    @component = Component.find(params[:id])
    @categories = Category.all
    @rooms = Room.all
    @suppliers = Supplier.all
    @attributes = Attribute.all
    @attribute_values = ComponentAttributeValue.where(component_id: @component.id)
  end

  def create
    #render plain: params[:component].inspect
    @component = Component.new(component_params)

    if @component.save
      @component.category.addribude.each do |attribute|
        #FIXME this should also happen when a new attribute gets added to the category!! and reverse
        ComponentAttributeValue.create(component_id: @component.id, attribute_id: attribute.id)
      end
      redirect_to action: 'edit', id: @component.id
      flash[:info] = t('new_component_success')
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
      if defined? params[:values].each
        params[:values].each do |id, attribute_value|
          ComponentAttributeValue.find(id).update(value: attribute_value)
        end
      end
      redirect_to action: 'index'
      flash[:info] = t('edit_success')
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
    params.require(:component).permit(:title, :category_id, :room_id, :supplier_id, :quantity, :invoice, :warranty)
  end

end
