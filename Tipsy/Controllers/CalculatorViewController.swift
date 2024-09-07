
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var tenPctButton : UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var tip=0.10
    var currentSplit=2
    var finalAmount="0.0"
    @IBAction func tipChanged(_ sender: UIButton) {
        let currentTip:String?=sender.titleLabel?.text!
        var tipSelectionMap:[String:Bool]=["0%":false,"10%":false,"20%":false]
        let btnEquivalentDict:[String:UIButton]=["0%":zeroPctButton,"10%":tenPctButton,"20%":twentyPercentButton]
        
        
        tipSelectionMap[currentTip!]=true
        _=btnEquivalentDict.map{(key,val) in
            btnEquivalentDict[key]?.isSelected=tipSelectionMap[key]!
        }
        
        let numericTip=Double(currentTip!.dropLast()) ?? 0.0
        tip=numericTip/100
//        print(tip)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
         currentSplit=Int(sender.value)
        splitNumberLabel.text=String(currentSplit)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let splitAmount=(Double(billTextField.text ?? "0.0") ?? 0.0)/Double(currentSplit)
        let tipAmount=splitAmount*tip
        
        finalAmount=String(format:"%.2f",Double(Double(splitAmount)+tipAmount))
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
                    
                    let destinationVC = segue.destination as! ResultsViewController
                    
                    //Set the destination ResultsViewController's properties.
                    destinationVC.result = finalAmount
                    destinationVC.tip = Int(tip * 100)
                    destinationVC.split = currentSplit
        }
    }
}

