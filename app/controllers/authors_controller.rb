class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create 
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else 
      render :new
    end
  end 
  
  def new
    @author = Author.new
  end 

  def update
    @author = Author.find(params[:id])
    @author.assign_attributes(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else 
      redirect_to edit_author_path(@author)
    end 
  end


  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
