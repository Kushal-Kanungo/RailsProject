require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'when creating an article' do
    # It will create a new method named article which when called return article object
    let(:article) { build :article }
    let(:article2) { build :article, title: 'Evil' }

    # logic we want to perform
    it 'should be valid user with all attributes' do
      expect(article.valid?).to eq(true)
    end

    it 'should not be valid for evil article' do
      expect(article2.valid?).to eq(false)
    end
  end
end
