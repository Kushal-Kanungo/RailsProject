class ArticleApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def all_articles
    @articles = Article.all
    # render json: @articles
    render json: @articles.to_json(only: %i[title body])
  end

  def article_by_id
    @article = Article.find(params[:id])
    render json: @article
  end

  private

  def render_not_found_response
    render json: { error: 'Article not found!' }, status: :not_found
  end
end
