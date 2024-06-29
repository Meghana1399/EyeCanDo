//
//  Keyboard.swift
//  KeyboardBCI
//
//  Created by Fatemeh on 1/24/23.
//

import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
    
   
}

class Keyboard: UIView {
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var sug1: UIButton!
    @IBOutlet weak var sug2: UIButton!
    @IBOutlet weak var sug3: UIButton!
    @IBOutlet weak var butbackspace: UIButton!
    @IBOutlet weak var butspace: UIButton!
    @IBOutlet weak var butreturn: UIButton!
   
    @IBOutlet weak var buttonA: UIButton!
    

    @IBOutlet weak var buttonB: UIButton!
    
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonH: UIButton!
    @IBOutlet weak var buttonI: UIButton!
    @IBOutlet weak var buttonJ: UIButton!
    @IBOutlet weak var buttonK: UIButton!
    @IBOutlet weak var buttonL: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    @IBOutlet weak var buttonN: UIButton!
    
    @IBOutlet weak var buttonO: UIButton!
    @IBOutlet weak var buttonP: UIButton!
    @IBOutlet weak var buttonQ: UIButton!
    @IBOutlet weak var buttonR: UIButton!
    @IBOutlet weak var buttonS: UIButton!
    @IBOutlet weak var buttonT: UIButton!
    @IBOutlet weak var buttonU: UIButton!
    @IBOutlet weak var buttonV: UIButton!
    @IBOutlet weak var buttonW: UIButton!
    
    @IBOutlet weak var buttonX: UIButton!
    @IBOutlet weak var buttonY: UIButton!
    @IBOutlet weak var buttonZ: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    
    var typedText: String = ""
    var counter = 0
    
    weak var delegate: KeyboardDelegate?

        // MARK:- keyboard initialization

    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initializeSubviews()
            initializecoloring()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
        initializecoloring()
        
        
        
        
        
        
           
    }
    func initializecoloring(){
        sug1.backgroundColor = UIColor.white
        sug2.backgroundColor = UIColor.white
        sug3.backgroundColor = UIColor.white
        butbackspace.backgroundColor = UIColor(named: "background")
        butspace.backgroundColor = UIColor(named: "background")
        butreturn.backgroundColor = UIColor(named: "background")
        buttonA.backgroundColor = UIColor(named: "background")
        buttonB.backgroundColor = UIColor(named: "background")
        buttonC.backgroundColor = UIColor(named: "background")
        buttonD.backgroundColor = UIColor(named: "background")
        buttonE.backgroundColor = UIColor(named: "background")
        buttonF.backgroundColor = UIColor(named: "background")
        buttonG.backgroundColor = UIColor(named: "background")
        buttonH.backgroundColor = UIColor(named: "background")
        buttonI.backgroundColor = UIColor(named: "background")
        buttonJ.backgroundColor = UIColor(named: "background")
        buttonK.backgroundColor = UIColor(named: "background")
        buttonL.backgroundColor = UIColor(named: "background")
        buttonM.backgroundColor = UIColor(named: "background")
        buttonN.backgroundColor = UIColor(named: "background")
        buttonO.backgroundColor = UIColor(named: "background")
        buttonP.backgroundColor = UIColor(named: "background")
        buttonQ.backgroundColor = UIColor(named: "background")
        buttonR.backgroundColor = UIColor(named: "background")
        buttonS.backgroundColor = UIColor(named: "background")
        buttonT.backgroundColor = UIColor(named: "background")
        buttonU.backgroundColor = UIColor(named: "background")
        buttonV.backgroundColor = UIColor(named: "background")
        buttonW.backgroundColor = UIColor(named: "background")
        buttonX.backgroundColor = UIColor(named: "background")
        buttonY.backgroundColor = UIColor(named: "background")
        buttonZ.backgroundColor = UIColor(named: "background")
        button0.backgroundColor = UIColor(named: "background")
        button1.backgroundColor = UIColor(named: "background")
        button2.backgroundColor = UIColor(named: "background")
        button3.backgroundColor = UIColor(named: "background")
        button4.backgroundColor = UIColor(named: "background")
        button5.backgroundColor = UIColor(named: "background")
        button6.backgroundColor = UIColor(named: "background")
        button7.backgroundColor = UIColor(named: "background")
        button8.backgroundColor = UIColor(named: "background")
        button9.backgroundColor = UIColor(named: "background")
        
        //-------------------------------------------------------
        
        sug1.titleLabel?.textColor = UIColor.black
        sug2.titleLabel?.textColor = UIColor.black
        sug3.titleLabel?.textColor = UIColor.black
        butbackspace.titleLabel?.textColor = UIColor.black
        butspace.titleLabel?.textColor = UIColor.black
        butreturn.titleLabel?.textColor = UIColor.black
        buttonA.titleLabel?.textColor = UIColor.black
        buttonB.titleLabel?.textColor = UIColor.black
        buttonC.titleLabel?.textColor = UIColor.black
        buttonD.titleLabel?.textColor = UIColor.black
        buttonE.titleLabel?.textColor = UIColor.black
        buttonF.titleLabel?.textColor = UIColor.black
        buttonG.titleLabel?.textColor = UIColor.black
        buttonH.titleLabel?.textColor = UIColor.black
        buttonI.titleLabel?.textColor = UIColor.black
        buttonJ.titleLabel?.textColor = UIColor.black
        buttonK.titleLabel?.textColor = UIColor.black
        buttonL.titleLabel?.textColor = UIColor.black
        buttonM.titleLabel?.textColor = UIColor.black
        buttonN.titleLabel?.textColor = UIColor.black
        buttonO.titleLabel?.textColor = UIColor.black
        buttonP.titleLabel?.textColor = UIColor.black
        buttonQ.titleLabel?.textColor = UIColor.black
        buttonR.titleLabel?.textColor = UIColor.black
        buttonS.titleLabel?.textColor = UIColor.black
        buttonT.titleLabel?.textColor = UIColor.black
        buttonU.titleLabel?.textColor = UIColor.black
        buttonV.titleLabel?.textColor = UIColor.black
        buttonW.titleLabel?.textColor = UIColor.black
        buttonX.titleLabel?.textColor = UIColor.black
        buttonY.titleLabel?.textColor = UIColor.black
        buttonZ.titleLabel?.textColor = UIColor.black
        button0.titleLabel?.textColor = UIColor.black
        button1.titleLabel?.textColor = UIColor.black
        button2.titleLabel?.textColor = UIColor.black
        button3.titleLabel?.textColor = UIColor.black
        button4.titleLabel?.textColor = UIColor.black
        button5.titleLabel?.textColor = UIColor.black
        button6.titleLabel?.textColor = UIColor.black
        button7.titleLabel?.textColor = UIColor.black
        button8.titleLabel?.textColor = UIColor.black
        button9.titleLabel?.textColor = UIColor.black
        
        
        
    }
    func initializeSubviews() {
        let xibFileName = "Keyboard" // xib extention not included
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }

        // MARK:- Button actions from .xib file
    func updatesug(){
        let textChecker = UITextChecker()
        let partial = typedText
        if (typedText.count==0){
            sug1.titleLabel?.text = ""
            sug2.titleLabel?.text = ""
            sug3.titleLabel?.text = ""
            return
        }
        let completions = textChecker.completions(
                            forPartialWordRange: NSRange(0..<partial.utf16.count),
                            in: partial,
                            language: "en_US"
                          )
        if (completions!.count >= 3){
            sug1.titleLabel?.text = completions![0]
            sug2.titleLabel?.text = completions![1]
            sug3.titleLabel?.text = completions![2]
        }
        if (completions!.count == 2){
            sug1.titleLabel?.text = completions![0]
            sug2.titleLabel?.text = completions![1]
            sug3.titleLabel?.text = ""
            
        }
        if (completions!.count == 1){
            sug1.titleLabel?.text = completions![0]
            sug2.titleLabel?.text = ""
            sug3.titleLabel?.text = ""
            
        }
    }
   
    @IBAction func keyTapped(sender: UIButton) {
        // When a button is tapped, send that information to the
        // delegate (ie, the view controller)
        let currtext = sender.titleLabel!.text!
        if (sender == butreturn){
            
            self.delegate?.keyWasTapped(character: typedText)
            typedText = ""
        }
        else if(sender == butbackspace){
            if (typedText.count==0){
                return
            }
            
            typedText.removeLast()
            word.text = typedText
            
        }
        else if (sender == butspace){
            typedText = typedText+" "
            word.text = typedText
            
        }
        else if (sender == sug1 || sender == sug2 || sender == sug3){
            typedText = sender.titleLabel!.text!
            word.text = typedText
            
        }
        
        else{
            typedText = typedText + sender.titleLabel!.text!
            word.text = typedText
            
        }
        updatesug()
    }


}
