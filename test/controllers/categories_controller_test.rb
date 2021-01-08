require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports")
    #create admin user
    @admin_user = User.create(username: "jonhoe", email: "jonhoe@gogo.com", password: "gagoka", admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    #method from test helper to sign in
    sign_in_as(@admin_user)

    #go to new category url
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    #method from test helper to sign in
    sign_in_as(@admin_user)
    
    #we see a change in number of categories once category is created - in this example, difference of 1
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: "Travel" } }
    end

    #redirect to the latest category
    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    #we see a change in number of categories once category is created - in this example, difference of 1
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: "Travel" } }
    end

    #redirect to the latest category
    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
