module HouseHelper
  require 'httparty'

  class GetSearch
    include HTTParty
    base_uri "http://www.zillow.com/webservice"
    # http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=<ZWSID>&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA
    def initialize(address,city_or_zip)
      @zwsid = ENV["ZILLOW_TOKEN"]
      @address = address
      @city_or_zip = city_or_zip
    end

    def get_house_info
      address = URI.escape(@address)
      city = URI.escape(@city_or_zip.to_s)
      self.class.get("/GetSearchResults.htm?zws-id=#{@zwsid}&address=#{address}&citystatezip=#{city}")
    end

    def get_error_code
      result = get_house_info
      code = result["searchresults"]["message"]["code"]
      case code
      when "0"
        "Request successfully processed"
      when "1"
        "Service error-there was a server-side error while processing the request"
      when "2"
        ["Welp.  Whoever coded this stupid website messed up."]
      when "3"
        ["Web services are currently unavailable","Please come back later and try again."]
      when "4"
        ["The Zillow Web Service is currently not available.","Please come bac later and try again."]
      when "500"
        ["Invalid or missing address parameter", "Please make sure you have inputted a  valid address."]
      when "501"
        ["Invalid or missing citystatezip parameter", "Please make sure you have inputted a  valid address."]
      when "502"
        ["No results found." , "Sorry, the address you provided is not found in Zillow's property database."]
      when "503"
        ["Failed to resolve city, state or ZIP code", "Please check to see if the city/state you entered is valid. If you provided a ZIP code, check to see if it is valid."]
      when "504"
        ["No coverage for specified area","The specified area is not covered by the Zillow property database. To see property coverage tables, click here.", "http://www.zillow.com/zestimate/#acc"]
      when "505"
        ["Timeout","Your request timed out. The server could be busy or unavailable. Try again later."]
      when "506"
        ["Address string too long.	If address is valid, try using abbreviations."]
      when "507"
        ["No exact match found.","Please verify that the given address is correct."]
      when "508"
        ["No exact match found.","Please verify that the given address is correct."]
      else
        ["you fucked up"]
      end
    end

    def get_zpid
      result = get_house_info
      zpid_and_lat_long = []
      zpid_and_lat_long.push(result["searchresults"]["response"]["results"]["result"]["zpid"])
      zpid_and_lat_long.push(result["searchresults"]["response"]["results"]["result"]["address"]["latitude"])
      zpid_and_lat_long.push(result["searchresults"]["response"]["results"]["result"]["address"]["longitude"])
    end
  end

  class GetDeepComps
    include HTTParty
    base_uri "http://www.zillow.com/webservice"

    def initialize(zpid)
      @zwsid = ENV["ZILLOW_TOKEN"]
      @zpid = zpid
    end

    def get_house_info
      self.class.get("/GetDeepComps.htm?zws-id=#{@zwsid}&zpid=#{@zpid}&count=5")
    end

    def get_house_pics
      self.class.get("GetUpdatedPropertyDetails.htm?zws-id=#{@zwsid}&zpid=#{@zpid}")
    end

    def pictures
      result = get_house_pics
      result["UpdatedPropertyDetails"]["response"]["links"]["photoGallery"] unless result["UpdatedPropertyDetails"] == nil
    end


    def get_specific_parameters
      result = get_house_info
      house = result["comps"]["response"]["properties"]["principal"]
      return house
    end
  end

  class WalkScore
    include HTTParty
    base_uri "http://api.walkscore.com"
    #http://api.walkscore.com/score?format=xml&address=1119%8th%20Avenue%20Seattle%20WA%2098101&lat=47.6085&lon=-122.3295&wsapikey=<YOUR-WSAPIKEY>

    def initialize(address,city,zip,lat,long)
      @wsid = ENV["WALK_SCORE_TOKEN"]
      @address = address
      @city = city
      @zip = zip.to_s
      @lat = lat
      @long = long
    end

    def get_house_info
      address = URI.escape(@address + " " + @city + " " + @zip)
      call = self.class.get("/score?format=xml&address=#{address}&lat=#{@lat}&lon=#{@long}&wsapikey=#{@wsid}")
    end

    def get_walk_score
      result = get_house_info
      [result["result"]["walkscore"], result["result"]["description"]]
    end
  end
end
