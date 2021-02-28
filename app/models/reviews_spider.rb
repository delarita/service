class ReviewsSpider < Kimurai::Base
    @name = 'reviews_spider'
    @engine = :mechanize
  
    def self.process(url)
      @start_urls = [url]
      self.crawl!
    end
  
    def parse(response, url:, data: {})
      response.xpath("//div[@class='lcorif fp-w']").each do |review|
        item = {}
  
        item[:name]      = review.css('TSUbDb')
        item[:rating]      = review.css('review-score-container')
        item[:stock_type] = review.css('Jtu6Td')
        
  
        Review.where(item).first_or_create
      end
    end
  end