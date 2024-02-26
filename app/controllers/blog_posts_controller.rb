class BlogPostsController < ApplicationController
  before_action :find_blog_post, only: %i[show edit update destroy]

  def index
    @blog_posts = BlogPost.paginate(page: params[:page]).all.desc_order
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)


    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blog_posts_url, notice: 'Blog post successfully created' }
      else
        format.html { render :new }
      end

      format.turbo_stream { render turbo_stream: turbo_stream.replace("blog_post_#{@blog_post.id}", partial: 'blog_posts/form', locals: { blog_post: @blog_post }) }
    end
  end

  def show
    @comments = @blog_post.comments.desc_order
    @comment = Comment.new
  end

  def edit; end

  def update

    if @blog_post.update(blog_post_params)
      redirect_to blog_posts_url, notice: "Blog post successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @blog_post.destroy

    redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.'
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :publication_at)
  end

  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  end
end
