//API that we will use to poplulate this model
//https://financialmodelingprep.com/api/v3/ratios-ttm/AAPL?apikey=demo

struct StockRatio {
 private let payoutRatioTTM : Double;
 private let currentRatioTTM : Double ; 
 private let quickRatioTTM : Double ;
 private let returnOnAssetsTTM : Double ; 
 private let returnOnEquityTTM : Double ; 
 private let dividendYieldTTM : Double;  

}

extension StockRatio {
    //expecting a json string that we will populate this model
	init?(json: [String: Any]) {
        //check if the available infromation and set the property
		guard 
            let payoutRatioTTM = json["payoutRatioTTM"] as? Double,
            let currentRatioTTM = json["currentRatioTTM"] as? Double,
            let quickRatioTTM = json["quickRatioTTM"] as? Double,
            let returnOnAssetsTTM = json["returnOnAssetsTTM"] as? Double,
	        let returnOnEquityTTM = json["returnOnEquityTTM"] as? Double,
            let dividendYieldTTM = json["dividendYieldTTM"] as? Double

		else {
			return nil
		}

        self.payoutRatioTTM = payoutRatioTTM
        self.currentRatioTTM = currentRatioTTM
        self.quickRatioTTM = quickRatioTTM
        self.returnOnAssetsTTM = returnOnAssetsTTM
        self.returnOnEquityTTM = returnOnEquityTTM
        self.dividendYieldTTM = dividendYieldTTM
    }
		
}


