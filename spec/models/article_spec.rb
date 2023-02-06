require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'when creating an article' do
    # It will create a new method named article which when called return article object
    # It is provided by the factorybot
    let(:article) { build :article }
    let(:article2) { build :article, title: 'Evil' }
    let(:article3) { build :article, title: article.title }

    # logic we want to perform
    it 'should be valid user with all attributes' do
      expect(article.valid?).to eq(true)
    end

    it 'should not be valid for evil article' do
      expect(article2.valid?).to eq(false)
    end
    it 'should give error for duplication' do
      article.save
      expect(article3.save).to eq(false)
      expect { article3.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should create an article' do
      dummy = create(:article)
      expect(dummy.valid?).to eq(true)
    end

    # ? To run a loop in it block
    it 'should run a loop' do
      titles = ['Harry potter', 'One Punch man']
      titles.each do |title_name|
        dummy = build(:article, body: title_name)
        expect(dummy.valid?).to eq(true)
      end
    end
  end
end
