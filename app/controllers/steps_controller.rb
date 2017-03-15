class StepsController < ApplicationController
    @@dipInfo = nil
    
    def index
        redirect_to feed_path
    end
    
    def new
        @step = Step.new
        @dip = Dip.find(params[:dip])
        @@dipInfo = @dip
    end
    
    def create
        @step = Step.new(step_params)
        @step.dip = @@dipInfo

        if @step.save
            if params[:images].each { |image|
                @step.step_elements.create(image: image)
            }
            end
            flash[:success] = "Step was successfully created!"
            redirect_to @@dipInfo
        else
            render 'new'
        end
    end
    
    private
    def step_params
        params.require(:step).permit(:description, :step_elements)
    end
end