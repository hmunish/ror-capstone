require 'rails_helper'

RSpec.describe 'category#index', type: :feature do
  before(:each) do
    @user1 = User.create(
      id: 100,
      name: 'Munish Halai',
      email: 'munish@yahoo.com',
      password: 'munish777',
      confirmed_at: Time.now
    )

    sign_in @user1

    @categories = [
      Category.create(
        id: 1,
        author_id: @user1.id,
        name: 'Transport',
        icon: 'https://unsplash.com/photos/igX2deuD9lc'
      ),
      Category.create(
        id: 2,
        author_id: @user1.id,
        name: 'Breakfast',
        icon: 'https://unsplash.com/photos/igX2deuD9lc'
      )
    ]

    visit user_categories_url(@user1.id)
  end

  describe '#Indexpage' do
    it 'should be able to view the name of category.' do
      @categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end

    it 'onclick of add category button redirects to new category form' do
      click_link 'Add new Category'
      expect(page).to have_current_path(new_user_category_path(@user1.id))
    end
  end
end
