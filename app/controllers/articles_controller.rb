class ArticlesController < ApplicationController

  def show
    #@article is an instance variable that can be used in show.html.erb under articles
    # params attribute is the same as the params attribute in javascript. getting the :id that is the same as the identifier in DB
    @article = Article.find(params[:id])
  end

  def index
    #index uses GET action to show all articles
    #rails convention
    @articles = Article.all
  end

end