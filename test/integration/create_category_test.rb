require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    #create admin user
    @admin_user = User.create(username: "jonhoe", email: "jonhoe@gogo.com", password: "gagoka", admin: true)
  end

  test "get new category form and create category" do
    #method from test helper to sign in
    sign_in_as(@admin_user)

    #go to new categories route
    get "/categories/new"
    assert_response :success

    #validates that there should be a difference of 1 in category count after doing the block method
    assert_difference "Category.count",1 do
      #go to post path with params to create obj
      post categories_path, params: { category: { name: "Sports" } }
      #redirect
      assert_response :redirect 
    end

    #go the the redirected page
    follow_redirect!
    assert_response :success

    #check if string "Sports" is present in the html rendered (response.body)
    assert_match "Sports", response.body
  end


  test "get new category form and reject invalid category submission" do
    #method from test helper to sign in
    sign_in_as(@admin_user)

    #go to new categories route
    get "/categories/new"
    assert_response :success

    #validates that there should be no difference in Count
    assert_no_difference "Category.count" do
      #go to post path with params to create obj
      post categories_path, params: { category: { name: " " } }
    end
    #we expect for an error message. we use the html element to check
    assert_match "errors", response.body
    #this allows us to check for existence of existing elements of the page
    assert_select 'div.alert'

  end
end
