class ArticlesController < ApplicationController
  before_action :set_article, only:[ :show, :edit, :update, :destroy ]
  before_action :article_params, only:[ :create, :update ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  # will find the article and display form
  def edit
  end

  # POST /articles or /articles.json
  # strong params create
  def create
      @article = Article.new(article_params)
      #hardcode user
      @article.user = User.first
      if @article.save
      #flash helper
      flash[:notice] = "Article was created successfully."
      #redirect to showpage
      # redirect_to article_path(@article)   shortcut below:
      redirect_to @article
      else 
      render 'new'
      end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  # will impact the articles table with the edit information
  def update
   if @article.update(article_params)
    flash[:notice] = "Article was updated successfully"
    redirect_to @article
   else
    render 'edit'
   end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
