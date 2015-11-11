class TalentsController < ApplicationController
  load_and_authorize_resource except: [:index, :show]

  def index
    if current_user
      @talents = current_user
                   .suitable_talents
                   .order(created_at: :desc)
                   .page(params[:page])
    else
      @talents = Talent
                  .eager_load(:tags)
                   .order(created_at: :desc)
                   .page(params[:page])
    end
  end

  def show
    @talent = Talent
                .unscoped
                .preload(:talent_applications, :users)
                .find(params[:id])
  end

  def new
    @talent = Talent.new
  end

  def create
    @talent = Talent.new(talent_params)
    if @talent.save
      tag_names = params[:talent][:tags].delete_if(&:blank?)
      @talent.update_tags(*tag_names)
      flash[:success] =
        t(:successfully_created, instance: t(:talent, count: 1))
      redirect_to @talent
    else
      render :new
    end
  end

  def update
    @talent = Talent.unscoped.find(params[:id])
    @talent.update_attributes(talent_params)
    redirect_to @talent
  end

  def apply
    talent = Talent.find(params[:id])
    talent.users << current_user
    redirect_to talent, success: t(:successfully_applied)
  end

  private

  def talent_params
    params
      .require(:talent)
      .permit(:project_id, :name, :description, :found, :active)
  end
end
