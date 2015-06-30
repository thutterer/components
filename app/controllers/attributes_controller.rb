class AttributesController < ApplicationController
  before_filter :authenticate_user!

  http_basic_authenticate_with name: 'admin', password: 'admin', except: [:index]

  def index
    @attributes = Attribute.all
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
    else
      render 'new'
    end
  end

  def update
    @attribute = Attribute.find(params[:id])

    if @attribute.update(attribute_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @attribute = Attribute.find(params[:id])
    @attribute.destroy

    redirect_to attributes_path
  end


  private
  def attribute_params
    params.require(:attribute).permit(:title)
  end

end
