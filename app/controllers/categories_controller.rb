class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]

  def index
    if params[:search_title]
      @categories = Category.search_title(params['search_title']).order(:title).paginate(:per_page => 10, :page => params[:page])
    else
      @categories = Category.order(:title).paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @attributes = Attribute.order(:title)
  end

  def edit
    @category = Category.find(params[:id])
    @attributes = Attribute.order(:title)
  end

  def create
    @category = Category.new(category_params)
    # render plain: params[:attributes].inspect
    if @category.save
      @category.addribude = []
      if defined? params[:attributes].values
        params[:attributes].values.each do |attribute_id|
          @category.addribude << Attribute.find(attribute_id)
        end
      end
      redirect_to @category
      flash[:info] = t('new_category_success')
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      @category.addribude = []
      if defined? params[:attributes].values
        params[:attributes].values.each do |attribute_id|
          @category.addribude << Attribute.find(attribute_id)
        end
      end
      # the following would be better as a ActiveRecord callback !
      @active_attribute_ids = []
      @existing_attribute_ids = []
      @category.addribude.each do |a| @active_attribute_ids << a.id end
      Component.where(category: @category.id).each do |component|
        ComponentAttributeValue.where(component_id: component.id).each do |cav|
          # remove values of detached attributes
          if @active_attribute_ids.exclude? cav.attribute_id
            cav.destroy
          else
            @existing_attribute_ids << cav.attribute_id
          end
        end
        # add values for newly attached attributes
        (@active_attribute_ids - @existing_attribute_ids).each do |missing_attribute_id|
          ComponentAttributeValue.create(component_id: component.id, attribute_id: missing_attribute_id, value: '')
        end
      end
      redirect_to @category
      flash[:info] = t('edit_success')
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end

end
