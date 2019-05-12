require 'rest-client'
require 'json'

class Organization
  attr_accessor :id, :name, :description, :imageUrl, :categories, :interests, :phone_number, :email, :facebook, :twitter, :website

  def initialize(init_params)
    @id = init_params['organizationId']
    @name = init_params['name']
    @description = init_params['description']
    @imageUrl = init_params['profileImageUrl']
    @phone_number = init_params['phoneNumber']
    @email = init_params['email']
    @facebook = init_params['facebookUrl']
    @twitter = init_params['twitterUrl']
    @website = init_params['externalWebsite']
    @categories = init_params['categories']
    @interests = init_params['interests']
  end

  def self.get_organizations(num, categories, interests)
    orgs = self.get_orgs_from_api()

    top_orgs = []
    orgs.each do |i|
      org_categories = i['categories']
      org_categories.each do |c|
        categories.each do |quiz_category|
          if c['categoryName'].downcase.include? quiz_category.downcase
            top_orgs.push(Organization.new(i))
          end
        end
      end
    end

    # if interests != nil
    #   top_orgs = top_orgs.sort_by { |org| -org.count_interest(interests)}
    # end
    return top_orgs[0 ... num]
  end

  def self.get_orgs_from_api()
    url = 'https://callink.berkeley.edu/api/Organizations'
    orgs = []
    pageNumber = 0

    loop do
      pageNumber += 1
      response = RestClient.get url, {'Accept': 'application/json', 
      :params => {
          :page => pageNumber, 
          :status => 'Active',
          :key => Figaro.env.callink_key, 
          :type => 'Registered Student Organizations'},
      }
      parsed = JSON.parse(response)
      orgs += parsed['items']
      totalPages = parsed['totalPages']
      pageNumber = parsed['pageNumber']
      break if pageNumber >= totalPages
    end
    return orgs
  end

  # no interests yet
  # def count_interest(i)
  #   count = 0
  #   self.interests.each do |ctg|
  #     if i.include?(ctg['categoryName'].titleize)
  #       count += 1
  #     end
  #   end
  #   return count
  # end
  
end
