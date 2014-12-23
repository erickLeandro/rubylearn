class TagsController < ApplicationController
	def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tag_params
      flash[:notice] = 'Atualizado com sucesso'
      redirect_to action: :index
    else
      render :edit
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new tag_params
    if tag.save
      flash[:notice]  = 'Evento inserido com sucesso'
      redirect_to action: :index
    else
      render :new, tag: tag
    end
  end

  private 

  def tag_params
    params.require(:tag).permit(:name)
  end

end