class CommentsController < ApplicationController
    before_action :authenticate_user!

    def new
        @article = Article.find params[:article_id]
        @comment = Comment.new
     end

    def reply
      @article = Article.find params[:article_id]
      @comment = Comment.new
      @parent = params[:id]

      render :new
    end


    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
        redirect_to article_path(params[:article_id]), notice: "Comment was successfull published."
        else
        flash[:notice] = @comment.errors.full_messages.to_sentence
        end
    end


    private
    def comment_params
        params.require(:comment).permit(:content, :parent_id).merge(article_id:  params[:article_id])
    end
end
