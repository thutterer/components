class AttributesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]

  def index
    @attributes = Attribute.paginate(:page => params[:page], :per_page => 10)
  end

  # def show
  #  @attribute = Attribute.find(params[:id])
  # end

  def new
    @attribute = Attribute.new
  end

  def edit
    @attribute = Attribute.find(params[:id])
  end

  def create
    @attribute = Attribute.new(attribute_params)

    if @attribute.save
      redirect_to action: 'index'
      flash[:info] = t('new_attribute_success')
    else
      render 'new'
    end
  end

  def update
    @attribute = Attribute.find(params[:id])

    if @attribute.update(attribute_params)
      redirect_to action: 'index'
      flash[:info] = t('edit_success')
    else
      render 'edit'
    end
  end

  def destroy
    @attribute = Attribute.find(params[:id])
    # I'm really not proud of this block
    # ... teach me how to use Callbacks :)

    # detach attribute from category
    Category.all.each do |category|
      if category.addribude.any? && defined? category.addribude.where(id: @attribute.id).first.destroy
        category.addribude.where(id: @attribute.id).first.destroy
      end
    end
    # remove all values for this attribute
    ComponentAttributeValue.all.each do |value|
      if value.attribute_id == @attribute.id
        value.destroy
      end
    end
    @attribute.destroy

    redirect_to attributes_path
  end


  private
  def attribute_params
    params.require(:attribute).permit(:title)
  end

end
