class RoomsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]

  def index
    if params[:search_title]
      @rooms = Room.search_title(params['search_title']).order(:title).paginate(:per_page => 10, :page => params[:page])
    else
      @rooms = Room.order(:title).paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to action: 'index'
      flash[:info] = t('new_room_success')
    else
      render 'new'
    end
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to action: 'index'
      flash[:info] = t('edit_success')
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path
  end


  private
  def room_params
    params.require(:room).permit(:title)
  end

end
