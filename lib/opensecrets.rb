require 'httparty'

module OpenSecrets

  class Member
    include HTTParty
    base_uri 'http://www.opensecrets.org/api'
    default_params :output => 'xml'
    format :xml

    # OpenSecrets information about a Member of Congress.
    #
    # @option options [String] apikey ("") an OpenSecrets API Key
    #
    def initialize(apikey)
      raise ArgumentError, 'You must provide an API Key' if apikey.blank?
      self.class.default_params :apikey => apikey
    end

    # Returns Personal Financial Disclosure (PFD) information for a member of Congress.
    #
    # See : http://www.opensecrets.org/api/?method=memPFDprofile&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [String] :year ("") Get data for specified year.
    #
    def pfd(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      raise ArgumentError, 'You must provide a :year option' if options[:year].blank?
      options.merge!({:method => 'memPFDprofile'})
      self.class.get("/", :query => options)
    end

    # Provides a list of trips paid for by private organizations taken by a specified member or their staff.
    #
    # See : http://www.opensecrets.org/api/?method=memTravelTrips&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [String] :year ("") Get data for specified year.
    #
    def trips(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      raise ArgumentError, 'You must provide a :year option' if options[:year].blank?
      options.merge!({:method => 'memTravelTrips'})
      self.class.get("/", :query => options)
    end

  end

  class Candidate
    include HTTParty
    base_uri 'http://www.opensecrets.org/api'
    default_params :output => 'xml'
    format :xml

    # OpenSecrets information about a Candidate.
    #
    # @option options [String] apikey ("") an OpenSecrets API Key
    #
    def initialize(apikey)
      raise ArgumentError, 'You must provide an API Key' if apikey.blank?
      self.class.default_params :apikey => apikey
    end

    # Provides summary fundraising information for specified politician.
    #
    # See : http://www.opensecrets.org/api/?method=candSummary&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [optional, String] :cycle ("") blank values returns current cycle.
    #
    def summary(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      options.merge!({:method => 'candSummary'})
      self.class.get("/", :query => options)
    end

    # Provides the top organizations contributing to specified politician.
    #
    # See : http://www.opensecrets.org/api/?method=candContrib&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [optional, String] :cycle ("") 2008 or 2010.
    #
    def contributors(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      options.merge!({:method => 'candContrib'})
      self.class.get("/", :query => options)
    end

    # Provides the top industries contributing to a specified politician.
    #
    # See : http://www.opensecrets.org/api/?method=candIndustry&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [optional, String] :cycle ("") blank values returns current cycle.
    #
    def industries(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      options.merge!({:method => 'candIndustry'})
      self.class.get("/", :query => options)
    end

    # Provides total contributed to specified candidate from specified industry for specified cycle.
    #
    # See : http://www.opensecrets.org/api/?method=candIndByInd&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [String] :indcode ("") a a 3-character industry code
    # @option options [optional, String] :cycle ("") 2010, 2008 allowed. leave blank for latest cycle.
    #
    def contributions_by_industry(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      raise ArgumentError, 'You must provide a :indcode option' if options[:indcode].blank?
      options.merge!({:method => 'candIndByInd'})
      self.class.get("/", :query => options)
    end

    # Provides sector total of specified politician's receipts.
    #
    # See : http://www.opensecrets.org/api/?method=candSector&output=doc
    #
    # @option options [String] :cid ("") a CRP CandidateID
    # @option options [optional, String] :cycle ("") blank values returns current cycle.
    #
    def sector(options = {})
      raise ArgumentError, 'You must provide a :cid option' if options[:cid].blank?
      options.merge!({:method => 'candSector'})
      self.class.get("/", :query => options)
    end

  end

end

