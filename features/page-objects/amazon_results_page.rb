require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

class SearchResultSection < SitePrism::Section
  element :title, 'h2.result__title'
  element :link, 'a.result__a'
  element :snippet, 'a.result__snippet'
end

class AmazonResultsPage < SitePrism::Page
  set_url 'https://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords={search_text*}'
  element :search_input, 'input#twotabsearchtextbox'
    element :search_button, 'div.nav-search-submit > input'
  sections :search_results, SearchResultSection, 'div.result__body'

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
