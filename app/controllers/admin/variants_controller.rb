class Admin::VariantsController < Admin::ApplicationController
  def index
    @variants = Variant.all
  end

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_attrs)

    if @variant.save
      redirect_to admin_variants_path
    else
      render action: :new
    end
  end

  def edit
    @variant = Variant.find(params[:id])
  end

  def update
    @variant = Variant.find(params[:id])

    if @variant.update(variant_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    variant = Variant.find(params[:id])
    variant.destroy
    redirect_to action: :index
  end

  private

  def variant_attrs
    params.require(:variant).permit(:title, :question_id)
  end
end
