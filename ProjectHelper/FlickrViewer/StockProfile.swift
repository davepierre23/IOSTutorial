//MODEL to sed to populate this end point 
//End we will use  https://financialmodelingprep.com/api/v3/profile/CU.TO?apikey=40d61e33f3a413f1c52d3cd0fe1c814e
struct StockProfile {
 private let symbol : String;   // used to save the ticker symbol
 private let exchange : String
 private let country : String;
 private let dividend : Double;
 private let description : String;
 private let beta : Double;
 private let  companyName : String;   // used to save company name 
 private let  photoURl : String; // used to dave the image url
 private let sector : String ;
 private let industry : String;
 private var  previousClosingPrice: Double;
 private var currentPrice : Double ;
 private var changeInPrice : String ;
 private var lastUpdated: String; 

}


extension StockProfile {
    //used to popluate the Stock Profile model
	init?(json: [String: Any]) {
		guard let symbol = json["symbol"] as? String,
            let exchange = json["exchangeShortName"] as? String,
            let dividend = json["lastDiv"] as? Double,
            let description = json["description"] as? String,
            let beta = json["beta"] as? Double,
            let companyName = json["companyName"] as? String,
            let country = json["country"] as? String,
            let photoURl = json["image"] as? String,
            let sector = json["sector"] as? String,
            let industry = json["industry"] as? String,
            let previousClosingPrice = json["previousClosingPrice"] as? Double,
            let currentPrice = json["currentPrice"] as? Double,
            let changeInPrice = json["changeInPrice"] as? String,
            let lastUpdated = json["lastUpdated"] as? String
		else {
			return nil
		}

        self.symbol = symbol
        self.exchange = exchange
        self.dividend = dividend
        self.beta = beta
        self.description = description
        self.country = country
        self.companyName = companyName
        self.industry = industry
        self.photoURl = photoURl
        self.sector = sector
        self.previousClosingPrice = previousClosingPrice
        self.currentPrice = currentPrice
        self.changeInPrice = changeInPrice
        self.lastUpdated = lastUpdated


		}
}


