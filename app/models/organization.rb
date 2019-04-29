require 'rest-client'
require 'json'

class Organization

    attr_accessor :id, :name, :description, :imageUrl, :categories, :interests

    def initialize(id, name, description, imageUrl, categories, interests)
        @id = id
        @name = name
        @description = description
        @imageUrl = imageUrl
        @categories = categories
        @interests = interests
    end

    def self.get_organizations(num, categories, interests)
        orgs = self.get_orgs_from_api()
	
        top_orgs = []
        orgs.each do |i|
            if categories == nil || categories.include?(i['type'])
                top_orgs.push(Organization.new(i['organizationId'], i['name'], i['description'], i['profileImageUrl'], i['type'], i['categories']))
            end
        end
	
        if interests != nil
            top_orgs = top_orgs.sort_by { |org| -org.count_interest(interests)}
        end
	
        return top_orgs[0 ... num]
    end
  
    def self.get_orgs_from_api()
        url = 'https://callink.berkeley.edu/api/Organizations'
        orgs = []
        pageNumber = 0
	
        loop do
            pageNumber += 1
            response = RestClient.get url, :params => {:page => pageNumber}
            parsed = JSON.parse(response)
            orgs += parsed['items']
            totalPages = parsed['totalPages']
            pageNumber = parsed['pageNumber']
	  
            break if pageNumber >= totalPages
        end
        
        return orgs
    end

    def count_interest(i)
        count = 0
        self.interests.each do |ctg|
            if i.include?(ctg['categoryName'])
                count += 1
            end
        end
        return count
    end
    
end
