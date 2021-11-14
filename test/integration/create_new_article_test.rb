require "test_helper"

class CreateNewArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "johndoe", email: "johndoe@example.com",
                              password: "password", admin: true)
  end
  test "create new article" do
    sign_in_as(@user)
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
    post articles_path, params: { article: { title: "Sports Article", description: "aslkFJKAfjajlasj"}}
      assert_response :redirect 
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports Article", response.body
  end

  
end
