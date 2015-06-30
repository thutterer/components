class CategoriesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  
  def index
    @categories = Category.all
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
      params[:attributes].values.each do |attribute_id| #FIXME if no attributes
        @category.addribude << Attribute.find(attribute_id)
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
      params[:attributes].values.each do |attribute_id| #FIXME if no attributes
        @category.addribude << Attribute.find(attribute_id)
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
