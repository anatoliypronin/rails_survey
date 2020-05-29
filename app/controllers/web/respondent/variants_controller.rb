class Web::Respondent::VariantsController < Web::Respondent::ApplicationController
  def index
    @variants = Variant.all
  end

  def new
    @variant = Variant.new
    @question = Question.find(params[:question_id])

    redirect_back fallback_location: respondent_surveys_path if @question.kind == 'input'
  end

  def show
    @variant = Variant.find(params[:id])
  end

  def create
    @variant = Variant.new(variant_attrs)
    @question = Question.find(params[:question_id])

    @variant.question = @question if @question

    if @variant.save
      redirect_to respondent_question_path(@question)
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
      redirect_to respondent_question_path(@variant.question_id)
    else
      render action: :edit
    end
  end

  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy

    redirect_to respondent_question_path(@variant.question_id)
  end

  private

  def variant_attrs
    params.require(:variant).permit(:title, :question_id)
  end
end
