require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET index' do
    let(:article) { create :article }
    # <================ Testing the get index ==================>
    it 'assigns @articles' do
      get :index # defining the controller method we want to test
      expect(assigns(:articles)).to eq([article]) # checking if @articles matches array of article we created
    end
  end
end
