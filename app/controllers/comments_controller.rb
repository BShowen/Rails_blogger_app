class CommentsController < ApplicationController

    include CommentsHelper
    
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save
        redirect_to article_path(@comment.article)
    end

    def destroy
        @comment = Comment.find(params[:article_id]).destroy
        flash.notice = "#{@comment.author_name}'s comment has been deleted."
        redirect_to article_path(@comment.article)
    end

end
