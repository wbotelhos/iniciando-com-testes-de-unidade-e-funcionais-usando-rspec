require 'spec_helper'

describe ArticlesController do
  describe '#create' do
    context 'with valid data' do
      it 'creates a new article' do
        expect {
          post :create, article: { title: 'The Title' }
        }.to change(Article, :count).by 1
      end

      it 'redirects to listing page' do
        post :create, article: { title: 'The Title' }
        expect(response).to redirect_to articles_url
      end

      it 'shows success message' do
        post :create, article: { title: 'The Title' }
        expect(flash.notice).to eq 'Artigo salvo com sucesso!'
      end

      it 'generates the slug' do
        post :create, article: { title: 'The Title' }
        expect(Article.last.slug).to eq 'the-title'
      end
    end

    context 'with invalid data' do
      it 'does not save the record' do
        expect {
          post :create, article: { title: nil }
        }.to_not change Article, :count
      end

      it 're-renders the new page' do
        post :create, article: { title: nil }

        expect(response).to render_template 'articles/new'
      end

      it 'shows flash message' do
        post :create, article: { title: nil }
        expect(flash.notice).to eq 'Erro ao salvar o artigo.'
      end
    end
  end

  describe '#index' do
    it 'executes successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index article page' do
      get :index
      expect(response).to render_template 'articles/index'
    end
  end
end
