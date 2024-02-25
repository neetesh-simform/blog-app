class BlogPostsController < ApplicationController
  def index
    @blog_posts = current_user.blog_posts
  end
end
