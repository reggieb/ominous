class ThingsController < ApplicationController
  before_filter :get_thing, :except => [:index, :new, :create]
  before_filter :get_new_thing, :only => [:new, :create]

  def index
    @things = Thing.all
  end

  def show
    if @thing.has_warning?
      Ominous::Warning.trigger(:thing_alert)
    end

  end


  def new

  end

  def edit
  end


  def create
    update_thing
  end

  def update
    update_thing
  end

  def destroy
    @thing.destroy
    redirect_to things_url
  end
  
  private
  def update_thing
    if @thing.update_attributes(params[:thing])
      redirect_to @thing, notice: "Thing was successfully #{action_name}d."
    else
      render action: "new"
    end
  end
  
  def get_thing
    @thing = Thing.find(params[:id])
  end
  
  def get_new_thing
    @thing = Thing.new
  end
end
