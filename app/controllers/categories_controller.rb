class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]

  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @attributes = Attribute.all
  end

  def edit
    @category = Category.find(params[:id])
    @attributes = Attribute.all
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
      redirect_to @category
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
