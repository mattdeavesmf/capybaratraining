require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

class AmazonPage < SitePrism::Page
  set_url 'https://www.amazon.co.uk/'
  set_url_matcher %r{amazon.co.uk\/?/}

  element :search_input, 'input#twotabsearchtextbox'
  element :search_button, 'div.nav-search-submit > input'

  def search(text)
    search_input.set text
    search_button.click
  end
end
