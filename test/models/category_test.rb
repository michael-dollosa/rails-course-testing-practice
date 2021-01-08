require 'test_helper' #this is needed for all test file

class CategoryTest < ActiveSupport::TestCase
  #setup would mean that this method will run before each test starts
  #we used setup to initialize @category
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    #@category = Category.new(name: "Sports") - this is already under setup
    assert @category.valid?
  end

  test "name should be present" do
    #we do not need to initialize @category since it's already done in setup
    @category.name = ""
    assert_not @category.valid? #test for false
  end

  test "name should be unique" do
    #we need to save first Category name of Sports to our test DB
    @category.save

    #create new category to test
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid? #test for false
  end

  test "name should not be too long" do
    @category.name = "a" * 100
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  

end
