class ArticleApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def all_articles
    @articles = Article.all
    # render json: @articles
    render json: @articles.to_json(only: %i[title body])
  end

  def article_by_id
    @article = Article.find(params[:id])
    render json: @article.to_json
  end

  def test_route
    param_data = params
    permitted_data = params.permit(:a)
    only_array = params.permit(b: [])
    render json: only_array
  end

  private

  def render_not_found_response
    render json: { error: 'Article not found!' }, status: :not_found
  end
end
