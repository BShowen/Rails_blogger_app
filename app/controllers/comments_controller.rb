class CommentsController < ApplicationController

    
    before_action :must_be_authenticated, except: [:create]

    include CommentsHelper

    def new 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.last

        
    end
    
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
    
    def edit
        @article = Article.find(params[:id])
        @comment = Comment.find(params[:article_id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params) 
        flash.notice = "#{@comment.author_name}'s' comment has been updated."

        redirect_to article_path(params[:article_id])
    end

    def must_be_authenticated
        unless current_user
            redirect_to root_path
          flash.notice = "You cant do that unless you're logged in"
          return false
        end
    end
    
end
