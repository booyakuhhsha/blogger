class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id
	end
	before_filter :require_login, only: [:new, :create, :edit, :destroy]
	def new
		@article = Article.new
	end
	before_filter :require_login, only: [:new, :create, :edit, :destroy]
	def create
		@article = Article.new(article_params)
  		@article.save

  		flash.notice = "Article '#{@article.title}' has been created!"

  		redirect_to article_path(@article)
	end
	before_filter :require_login, only: [:new, :create, :edit, :destroy]
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article '#{@article.title}' has been deleted!"

		redirect_to action: "index"
	end
	before_filter :require_login, only: [:new, :create, :edit, :destroy]
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' updated!"

		redirect_to article_path(@article)
	end

end
