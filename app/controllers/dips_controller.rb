class DipsController < ApplicationController
  before_action :set_dip, only: [:show, :edit, :update, :destroy]

  # GET /dips
  # GET /dips.json
  def index
    @dips = Dip.all
  end

  # GET /dips/1
  # GET /dips/1.json
  def show
  end

  # GET /dips/new
  def new
    @dip = Dip.new
  end

  # GET /dips/1/edit
  def edit
  end

  # POST /dips
  # POST /dips.json
  def create
    @dip = Dip.new(dip_params)
    @dip.user = current_user
    
    if @dip.save
      @step = Step.new(dip_params)
      @step.dip = @dip

      if @step.save
        if params[:images].each { |image|
          @step.step_elements.create(image: image)
        }
        end
        flash[:success] = "Dip was successfully created!"
        redirect_to feed_path
      else
        @dip.destroy
        render 'new'
      end
    else
      render 'new'
    end
  end

  # PATCH/PUT /dips/1
  # PATCH/PUT /dips/1.json
  def update
    respond_to do |format|
      if @dip.update(dip_params)
        format.html { redirect_to @dip, notice: 'Dip was successfully updated.' }
        format.json { render :show, status: :ok, location: @dip }
      else
        format.html { render :edit }
        format.json { render json: @dip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dips/1
  # DELETE /dips/1.json
  def destroy
    @dip.destroy
    respond_to do |format|
      format.html { redirect_to dips_url, notice: 'Dip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dip
      @dip = Dip.find(params[:id])
    end

    def dip_params
      params.require(:dip).permit(:name, :description, :step_elements)
    end
  
end
