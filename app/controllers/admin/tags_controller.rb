class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_attrs)

    if @tag.save
      redirect_to admin_tags_path
    else
      render action: :new
    end
  end
  
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to action: :index
  end

  private

  def tag_attrs
    params.require(:tag).permit(:title)
  end
end
