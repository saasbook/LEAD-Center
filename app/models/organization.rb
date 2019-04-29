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
    url = 'https://callink.berkeley.edu/api/Organizations?page='
    totalPages = 1
    pageNumber = 1
    orgs = []
    while pageNumber <= totalPages
      response = RestClient.get url + pageNumber.to_s
      parsed = JSON.parse(response)
      orgs = orgs + parsed['items']
      totalPages = parsed['totalPages']
      pageNumber += 1
    end
    top_orgs = []
    orgs.each do |i|
        if categories == nil||categories.include?(i['type'])
            top_orgs.push(Organization.new(i['organizationId'], i['name'], i['description'], i['profileImageUrl'], i['type'], i['categories']))
        end
      end
    if interests != nil
      top_orgs = top_orgs.sort_by { |org| -org.count_interest(interests)}
    end
    top_orgs = top_orgs[0 ... num]
    return top_orgs
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
