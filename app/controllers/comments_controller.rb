class CommentsController < ApplicationController
  http_basic_authenticate_with name: "mashrur", password: "secret", only: :destroy
  before_action :get_article, only: [:create, :destroy]

  def create
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
