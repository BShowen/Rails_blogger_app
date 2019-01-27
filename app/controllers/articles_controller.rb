class ArticlesController < ApplicationController
    
    before_action :must_be_authenticated, only: [:new, :create, :destroy, :edit, :update]

    include ArticlesHelper

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end

    def new 
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save
        flash.notice = "Article '#{@article.title}' has been created."
        redirect_to article_path(@article)
    end
    
    def destroy 
        @article = Article.find(params[:id]).destroy
        flash.notice = "Article '#{@article.title}' Deleted."
        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' Updated."
        redirect_to article_path(@article)
    end

    def must_be_authenticated
        unless current_user
            redirect_to root_path
            flash.notice = "You cant do that unless you're logged in"
            return false
        end
    end
end