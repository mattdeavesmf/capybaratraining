require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

class AmazonSearchResultSection < SitePrism::Section
    element :div, 'result_*'
  element :title, 'h2.s-access-title'
  element :link, 'a.s-access-detail-page'
  element :image, 'img.s-access-image'
end

class AmazonResultsPage < SitePrism::Page
  #set_url 'https://duckduckgo.com/?q={search_text*}'
  element :search_input, 'input#twotabsearchtextbox'
  element :search_button, 'div.nav-search-submit > input'
  sections :search_results, AmazonSearchResultSection, 'div#resultsCol'

  def search(text)
    search_input.set text
    search_button.click
  end

  def search_result_titles
    search_results.map(&:title)
  end

  def search_result_texts
    search_results.map(&:text)
  end

  def search_result_links
    search_results.map { |sr| sr.link['href'] }
  end
end
