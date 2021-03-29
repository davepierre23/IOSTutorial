



//To calculate a DRIP
let  amountInvest = 1400.00
let sharePrice = 25.33
let dividendPrice = 0.172

let numSharePerYear = 0 
let freq = 0  // number of times we get a dividend payement 

let currentNumShareInPortforlio = 0 

//if dividend price is not bigger than 0 then we should return 0
//if(dividendPrice>0){
//    return numSharePerYear
//}

print(sharePrice/dividendPrice)

let numSharePurchase = amountInvest / sharePrice
print(numSharePurchase)

let dividendPayedPerSecession = numSharePurchase * dividendPrice
print(dividendPayedPerSecession)

// take the earning from dividend and divide by the amount that it coust to buy a share 
let dripShare = dividendPayedPerSecession / sharePrice
print(dripShare)
let remainingPrice = amountInvest  - (numSharePurchase * sharePrice)  
print(remainingPrice)
print(numSharePurchase)


//annualIncome
let annualIncome = numSharePurchase * dividendPrice 


//Remaining cash


