# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# To remove the field_with_errors functionality, add the following code to the bottom of the config/environment.rb file:
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end