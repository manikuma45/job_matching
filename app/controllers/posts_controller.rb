class PostsController < ApplicationController
  before_action :set_post, only:[:edit,:update,:show]

  def new
    @post = current_company.posts.build
    @post.post_industries.build
    @post.post_job_categories.build
    @post.post_skills.build

  end

  def create
    @post = current_company.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :salary,
      :number_of_recruits,
      :position,
      :description,
      :location,
      :company_id,
      post_industries_attributes: [:id, :post_id, :industry_id],
      post_job_categories_attributes: [:id, :post_id, :job_category_id],
      post_skills_attributes: [:id, :post_id, :company_skill_id],
    )
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end