# Request spec testing is better than controller testing because it can also test route
require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /index' do
    it 'it should return status 200' do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post /article' do
    it 'it should create a new article' do
      post articles_path, params: {
        article: article_params
      }
      expect(Article.count).to be(1)
    end
  end

  describe 'Put /article/id' do
    # ? To pass id in member routes
    it 'it should edit an article' do
      article = Article.create(title: 'It is a neame', body: 'It is a body')
      patch article_path(id: article.id), params: {
        article: {
          title: 'Updated',
          body: 'Updated Body'
        }
      }
      expect(Article.first.title).to eq('Updated')
    end
  end

  describe '::Delete a an article' do
    it 'should delete an article' do
      article1 = create(:article)
      article2 = create(:article)
      delete article_path(id: article1.id)
      expect(Article.count).to be(1)
    end
  end

  def article_params
    {
      title: Faker::Book.title,
      body: Faker::Alphanumeric.alpha(number: 11)
    }
  end
end
