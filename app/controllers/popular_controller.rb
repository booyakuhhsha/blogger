class PopularController < ApplicationController
	def index
		@articles = Article.all
	end
end
