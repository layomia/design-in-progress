class CommentsController < ApplicationController
    before_action :require_user
    
    def create
        @comment = @commentable.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        step_type = @comment.commentable_type == "Step"
        
        if @comment.save
            @new_comment = @commentable.comments.new
            respond_to do |format|
                format.html do
                    #flash[:success] = 'Comment posted.'
                    redirect_to step_type ? @commentable.dip : @commentable.step.dip
                end
                format.js
            end
        else
            @new_comment = @comment
            respond_to do |format|
                format.html { redirect_to step_type ? @commentable.dip : @commentable.step.dip }
                format.js { render action: 'failed_save' }
            end
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @commentable = @comment.commentable
        step_type = @comment.commentable_type == "Step"
        
        @comment.destroy
        respond_to do |format|
            format.html do
                flash[:success] = 'Comment posted.'
                redirect_to step_type ? @commentable.dip : @commentable.step.dip
            end
            format.js # JS response
        end
    end
   
    private
    
    def comment_params
        params.require(:comment).permit(:body, :relX, :relY)
    end
end