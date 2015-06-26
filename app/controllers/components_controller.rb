class ComponentsController < ApplicationController
  def index
    @components = Component.all
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
  end

  def edit
    @component = Component.find(params[:id])
  end

  def create
    #render plain: params[:component].inspect
    @component = Component.new(component_params)

    if @component.save
      redirect_to @component
    else
      render 'new'
    end
  end

  def update
    @component = Component.find(params[:id])

    if @component.update(component_params)
      redirect_to @component
    else
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
    params.require(:component).permit(:title, :category)
  end

end
