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

  def new
    @article = Article.new #this is for new page validation will work
  end

  def create
    #this means require article key and permit title and description from there to be used to create object
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect #to check object created

    #validation
    if @article.save # to save the object in DB
      #to display message- optional. this will be above "yield" tag on main application erb
      flash[:notice] = "Article was created successfully"

      #specify where rails need to redirect after creating object. 
      #redirect_to article_path(@article)
      #shortcut
      redirect_to @article
    else 
      render 'new' #render new html erb
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    #find first the id of the article where the object is pointing to
    @article = Article.find(params[:id])

    #update the data
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was modified successfully"

      redirect_to @article
    else
      render 'edit' #render the edit form again
    end
  end
    


end