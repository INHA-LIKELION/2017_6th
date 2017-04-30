class PostController < ApplicationController
  def new
  end

  def create
    @title = params[:title]
    @content = params[:content]

    @imgUploader = ImgUploader.new
    @imgUploader.store!(params[:img])

    @post = Post.new
    @post.title = @title
    @post.content = @content

    @post.img_url = @imgUploader.url

    @post.save

    redirect_to '/'
  end
end
