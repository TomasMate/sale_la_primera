class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
            
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new  
    end

    def edit 
        
    end

    def create
        @article = Article.new(article_params)        
        if @article.save
            flash[:notice] = "Article was saved successfully."
            redirect_to @article  #Tambien puedo redirect_to articles_path (route del show de articulos). Para que rails detecte el id
                                    # del ultimo objeto cargado "en memoria",le digo articles_path(@articles), o solo @articles y extrae su id
        else 
           render 'new'
        end        
    end

def update        
        if @article.update(article_params)
            flash[:notice] = "Article was edited successfully."
            redirect_to @article  #Tambien puedo redirect_to articles_path (route del show de articulos). Para que rails detecte el id
                                    # del ultimo objeto cargado "en memoria",le digo articles_path(@articles), o solo @articles y extrae su id
        else 
           render 'edit'
        end        
end

def destroy
     #Destroy no tiene acceso por route. Tengo que traerlo de otro lado (agregando link)
    @article.destroy
    flash[:notice] = "Article was Deleted successfully."
    redirect_to articles_path
end


private

def set_article
    @article = Article.find(params[:id])
end

def article_params
    params.require(:article).permit(:title, :description)
end

end