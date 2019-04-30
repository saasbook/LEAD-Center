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
            if categories == nil || categories.size == 0 || categories.any?{ |s| s.casecmp(i['type']) == 0 }
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
            begin
                response = RestClient.get url, :params => {:page => pageNumber, :key => Figaro.env.callink_key}
                parsed = JSON.parse(response)
            rescue RestClient::ExceptionWithResponse => err # We don't have the keys yet, so on 401 error display placeholder orgs
                placeholder = File.new("spec/response/raw_organizations_response.txt")
                parsed = JSON.parse(placeholder.read)
            end
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
            if i.any?{ |s| s.casecmp( ctg['categoryName']) == 0 }
                count += 1
            end
        end
        return count
    end
    
end
