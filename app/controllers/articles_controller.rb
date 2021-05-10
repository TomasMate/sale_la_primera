class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new  
    end

    def edit 
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        
        if @article.save
            flash[:notice] = "Article was saved successfully."
            redirect_to @article  #Tambien puedo redirect_to articles_path (route del show de articulos). Para que rails detecte el id
                                    # del ultimo objeto cargado "en memoria",le digo articles_path(@articles), o solo @articles y extrae su id
        else 
           render 'new'
        end        
    end

def update
    @article = Article.find(params[:id])
        
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was edited successfully."
            redirect_to @article  #Tambien puedo redirect_to articles_path (route del show de articulos). Para que rails detecte el id
                                    # del ultimo objeto cargado "en memoria",le digo articles_path(@articles), o solo @articles y extrae su id
        else 
           render 'edit'
        end        
end


end