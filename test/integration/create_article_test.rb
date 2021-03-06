require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "ku@mail.ru",
                        password: "password", admin: true)
  end

  test "should create a new article" do
    sign_in_as(@user,"password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "kukushka",
      description: "an article about kukushka"}
    end
    assert_template 'articles/show'
    assert_match "kukushka", response.body
  end
end