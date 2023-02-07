require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET index' do
    let(:article) { create :article }

    # <========== Hooks ==========>
    before(:each) do
      get :index
    end

    # <================ Testing the get index ==================>
    it 'should assigns @articles' do
      article2 = create(:article)
      # defining the controller method we want to test
      expect(assigns(:articles)).to eq([article2, article]) # checking if @articles matches array of article we created
      expect(response).to render_template('index')
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should give status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    it 'should accepts the params of article create a new article and redirect to show page' do
      post :create, params: {
        article: article_params
      }
      # In Rspec subject is the object testing is performed on
      expect(subject).to redirect_to(assigns(:article))

      # If there is no redirect and we want to check json data then we validate it with the render template
      # TODO: expect(response).to render_template('path_to_the_views')
    end

    it 'should should give error for invalid article data' do
      post :create, params: {
        article: {
          title: 'small',
          body: 'small'
        }
      }
      expect(assigns(:article).valid?).to_not eq(true)
    end
  end

  describe 'Patch update' do
    let(:article) { create(:article) }

    it 'should update our article' do
      patch :update, params: {
        article: article_params,
        id: article.id
      }
      expect(subject).to redirect_to(assigns(:article))
    end
  end

  describe 'Delete destroy' do
    # let(:article1) { create :article }
    # let(:article2) { create :article }
    # let(:article3) { create :article }

    it 'should reduce the article count by 1' do
      article1 = create :article
      article2 = create :article
      article3 = create :article
      delete :destroy, params: {
        id: article1.id
      }
      expect(Article.count).to eq(2)
    end
  end

  def article_params
    {
      title: Faker::Book.title,
      body: Faker::Alphanumeric.alpha(number: 11)
    }
  end
end
