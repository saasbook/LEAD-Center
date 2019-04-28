require 'rest-client'
require 'json'

class Organization

  attr_accessor :id, :name, :description, :imageUrl

  def initialize(id, name, description, imageUrl)
    @id = id
    @name = name
    @description = description
    @imageUrl = imageUrl
  end

  def self.get_organizations(num, categories, interests)
    response = RestClient.get 'https://callink.berkeley.edu/api/Organizations'
    parsed = JSON.parse(response)
    orgs = parsed['items']
    top_orgs = []
    neworg = Organization.new(orgs[0]['organizationId'], orgs[0]['name'], orgs[0]['description'], orgs[0]['profileImageUrl'])
    top_orgs.push(neworg)
    return top_orgs
  end

end
