class RoomsController < ApplicationController
  # Loads:
  # @rooms = all rooms
  # @room = current room when applicable
  before_action :load_entities
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_parameters)
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @room.update_attribute(room_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
    else
      render :new
    end
  end

  def show
    @room_message = RoomMessage.new(room: @room)
    @room_messages = @room.room_messages.includes(:user)
  end

  def destroy
    if current_user.admin
      @room.room_messages.destroy_all
      if @room.destroy
        flash[:success] = "Room deleted"
        redirect_to rooms_path
      else
        flash[:danger] = "Error deleting room"
        redirect_to @room
      end
    end
  end

  protected
  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def room_parameters
    params.require(:room).permit(:name)
  end
end
