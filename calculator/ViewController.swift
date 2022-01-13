//
//  ViewController.swift
//  calculator
//
//  Created by 方仕賢 on 2022/1/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //功能物件
    @IBOutlet weak var buttonsView: UIView!
    
    @IBOutlet weak var exchangeView: UIView!
    
    @IBOutlet weak var exchangeButton: UIButton!
    
    
    //分攤物件
    
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var peopleCountTextField: UITextField!
    @IBOutlet weak var totalCurrentTextField: UITextField!
    @IBOutlet weak var splitButton: UIButton!
    
    @IBOutlet weak var roundSwitch: UISwitch!
    //
    
    
    //換匯物件
    
    
    @IBOutlet weak var inputCurrencyTextField: UITextField!
    
    
    @IBOutlet weak var ntdTextField: UITextField!
    
    @IBOutlet weak var exchangeCurrencyButton: UIButton!
    
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
    //
    
    //租車物件
    
    @IBOutlet var carRentView: UIView!
    @IBOutlet weak var totalRentalLabel: UILabel!
    

    @IBOutlet weak var rentalPerHourTextField: UITextField!
    
    @IBOutlet weak var rentalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var kmTextField: UITextField!
    
    @IBOutlet weak var pricePerKMTextField: UITextField!
    @IBOutlet weak var hoursTextField: UITextField!
    
    @IBOutlet weak var gasFeeTextField: UITextField!
    
    @IBOutlet weak var highestHourTextField: UITextField!
    
    @IBOutlet weak var calculateTotalRentalButton: UIButton!
    
    @IBOutlet weak var clearRentalButton: UIButton!
    
    //
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        carRentView.isHidden = true
        splitView.isHidden = false
        exchangeView.isHidden = true
        gasFeeTextField.isHidden = true
    }

    @IBAction func split(_ sender: UIButton) {
        
        view.endEditing(true)
        
        var people = 0
        var total: Float = 0
        
        if let peopleCount = peopleCountTextField.text {
            people = Int(peopleCount) ?? 0
            
        }
        
        if let totalCurrent = totalCurrentTextField.text {
            
            total = Float(totalCurrent) ?? 0
            
        }
        
        if roundSwitch.isOn {
            
            resultLabel.text = "\(round(total/Float(people)))"
            
        } else {
            
            resultLabel.text = "\(total/Float(people))"
            
        }
   
    }
    
    
    @IBAction func toggleSwitch(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func dividedButton(_ sender: UIButton) {
        
        splitView.isHidden = false
        exchangeView.isHidden = true
        carRentView.isHidden = true
        
    }
    
    @IBAction func chooseExchange(_ sender: Any) {
        splitView.isHidden = true
        exchangeView.isHidden = false
        carRentView.isHidden = true
    }
    
    func transformString(currency: Float, locale: String) -> String {
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyISOCode
        formatter.locale = Locale(identifier: locale)
        
       return formatter.string(from: NSNumber(value: currency))!
    }
    
    
    @IBAction func exchangeCurrency(_ sender: UIButton) {
        
        
        
        var dollars: Float = 0
        var NTDollars: Float = 0
        
        if let sDollars = inputCurrencyTextField.text {
            
            dollars = Float(sDollars) ?? 0
        }
        
        if let sDollars = ntdTextField.text {
            
            NTDollars = Float(sDollars) ?? 0
            
        }
            
        
        switch currencySegmentedControl.selectedSegmentIndex {
            
        case 0:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 27.68
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "en_US")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 27.68
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 1:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 0.24
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "ja_JP")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 0.24
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 2:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 0.023
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "ko_KR")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 0.023
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 3:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 0.28
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "ch_HK")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 0.28
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 4:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 31.55
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "en_EU")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 31.55
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 5:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 37.83
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "en_UK")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 37.83
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 6:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 0.83
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "th_TH")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 0.83
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
           
        case 7:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 0.0012
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "vi_VN")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 0.0012
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 8:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 22.08
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "en_CA")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 22.08
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        case 9:
            if ntdTextField.isEditing == true {
                
                dollars = NTDollars / 0.54
                
                inputCurrencyTextField.text = transformString(currency: dollars, locale: "en_PH")
                
            } else if inputCurrencyTextField.isEditing == true {
                NTDollars = dollars * 0.54
                
                ntdTextField.text = transformString(currency: NTDollars, locale: "zh_TW")
            }
            
        default:
            print("0")
        }
        
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func clearAllCurrency(_ sender: Any) {
        view.endEditing(true)
        ntdTextField.text = ""
        inputCurrencyTextField.text = ""
    }
    
    // Car Rent
    
    
    @IBAction func chooseRent(_ sender: Any) {
        
        carRentView.isHidden = false
        splitView.isHidden = true
        exchangeView.isHidden = true
        
        
    }
    
    
    @IBAction func calculateTotalRental(_ sender: UIButton) {
        
        
        
        var totalRental: Float = 0
        var rentalPerHour: Int?
        var totalHours: Float?
        var highestHour: Int?
        var km: Float?
        var pricePerKM: Int?
        
        if let rentalPerHourText = rentalPerHourTextField.text {
            
            rentalPerHour = Int(rentalPerHourText) ?? 0
            
        }
        
        if let totalHoursText = hoursTextField.text {
            
            totalHours = Float(totalHoursText) ?? 0
        }
        
        if let highestHourText = highestHourTextField.text {
            
            highestHour = Int(highestHourText) ?? 0
          
        }
        
        if totalHours! > Float(highestHour!) && highestHour! != 0 {
           
            totalRental += Float(highestHour! * rentalPerHour!)
            
        } else {
            
            totalRental += totalHours! * Float(rentalPerHour!)
        }
            
       
        
        switch rentalSegmentedControl.selectedSegmentIndex {
            
        case 0:
            
            if let kmText = kmTextField.text{
                
                km = Float(kmText) ?? 0
                
            }
            
            if  let pricePerKMText = pricePerKMTextField.text {
                pricePerKM = Int(pricePerKMText) ?? 0
            }
            
            totalRental += (Float(pricePerKM!)*km!)
            
           
            
            
        default:
            
            if let gasFeeText = gasFeeTextField.text {
                
                totalRental += Float(gasFeeText) ?? 0
                
            }
            
            
        }
        
        
        totalRentalLabel.text = "\(totalRental)"
       
        
        view.endEditing(true)
    }
    
    
    @IBAction func chooseMileOrGas(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            pricePerKMTextField.isHidden = false
            kmTextField.isHidden = false
            
            gasFeeTextField.isHidden = true
            
        } else {
            
            pricePerKMTextField.isHidden = true
            kmTextField.isHidden = true
            
            gasFeeTextField.isHidden = false
            
            
        }
        
        view.endEditing(true)
    }
    
    
    @IBAction func clearAllRentalRecord(_ sender: Any) {
        totalRentalLabel.text = "0"
        
        rentalPerHourTextField.text = ""
        hoursTextField.text = ""
        highestHourTextField.text = ""
        kmTextField.text = ""
        pricePerKMTextField.text = ""
        gasFeeTextField.text = ""
        
        view.endEditing(true)
    }
    
}

