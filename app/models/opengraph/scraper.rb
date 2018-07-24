require 'mechanize'

module Opengraph
  class Scraper
    def initialize
      @agent = Mechanize.new
      @agent.user_agent_alias = 'Mac Safari'
    end

    def load(url)
      @page = @agent.get(url)
      {
        url: search_url || url,
        title: search_title,
        description: search_description,
        image: search_image,
        site_name: search_site_name
      }
    end

    private

    def search_url
      search_canonical || search_meta('property', 'og:url')
    end

    def search_title
      search_meta('property', 'og:title') || search_meta('name', 'twitter:title') || search('title')
    end

    def search_description
      search_meta('property', 'og:description') || search_meta('name', 'twitter:description') || search_meta('name', 'description')
    end

    def search_image
      search_meta('property', 'og:image') || search_meta('name', 'twitter:image:src')
    end

    def search_site_name
      search_meta('property', 'og:site_name')
    end

    def search(key)
      @page.search(key)[0].text if @page.search(key).size.positive?
    end

    def search_meta(key, value)
      @page.search("meta[#{key}='#{value}']")[0].attributes['content'].value if @page.search("meta[#{key}='#{value}']").size.positive?
    end

    def search_canonical
      @page.search('link[rel="canonical"]')[0].attributes['href'].value if @page.search('link[rel="canonical"]').size.positive?
    end
  end
end
