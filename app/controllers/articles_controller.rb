class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /articles or /articles.json
  def index
    @categories = Category.all
    @q = Article.ransack(params[:q])
    
    cat = params[:cat]
    if !cat.nil?
      @articles = Article.where(:category_id => cat).paginate(page: params[:page], per_page: 6).order(id: :desc)
    else
      @articles = @q.result.paginate(page: params[:page], per_page: 6).order(id: :desc)
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @q = Article.ransack(params[:q])
    @categories = Category.all

  end

  # GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
    
  end

  # GET /articles/1/edit
  def edit
    @categories = Category.all

  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @categories = Category.all.map {|c| [c.name, c.id]}


    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :image, :category_id)
    end
end
