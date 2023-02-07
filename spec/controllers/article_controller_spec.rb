require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET index' do
    let(:article) { create :article }
    # <================ Testing the get index ==================>
    it 'should assigns @articles' do
      article2 = create(:article)
      get :index # defining the controller method we want to test
      expect(assigns(:articles)).to eq([article2, article]) # checking if @articles matches array of article we created
      expect(response).to render_template('index')
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template' do
      get :index # defining the controller method we want to test
      expect(response).to render_template('index')
    end

    it 'should give status code 200' do
      get :index # defining the controller method we want to test
      expect(response).to have_http_status(:ok)
    end
  end
end
