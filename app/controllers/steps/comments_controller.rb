class Steps::CommentsController < CommentsController
    before_action :set_commentable
    
    private
    
    def set_commentable
        @commentable = Step.find(params[:step_id])
    end
end