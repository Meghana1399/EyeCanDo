import UIKit

class ViewController: UIViewController, KeyboardDelegate, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    var timecount = 0
    var charcount = 0
    var arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    var timer:Timer?
    let keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 500))
    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize custom keyboard
        
        keyboardView.delegate = self // the view controller will be notified by the keyboard whenever a key is tapped
        
        // replace system keyboard with custom keyboard
        textField.inputView = keyboardView
        self.textField.delegate = self
    }

    // required method for keyboard delegate protocol
    func keyWasTapped(character: String) {
        textField.insertText(character)
        timecount = 0
        charcount = 0
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        timecount = 0
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        

  }
    @objc func update(){
        
                
        if (timecount >= 2800){
            timecount = 0
            charcount+=1
        }
        if (timecount==0){
            if(charcount>=0){
                arr.shuffle()
                
            }
            
            
        }

        var intensifying: Bool
        if (timecount%200 < 175){
            intensifying = true
        }
        else{
            intensifying = false
        }
        let r = arr[timecount/200]
        if (r==0){
            keyboardView.sug1.backgroundColor = intensifying ? UIColor(named: "foreground") :  UIColor.white
            keyboardView.sug2.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.sug3.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
        }
        if (r==1){
            keyboardView.butbackspace.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.butspace.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.butreturn.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
        }
        if (r==2){
            keyboardView.buttonA.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonB.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonC.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonD.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonE.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonF.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==3){
            keyboardView.buttonG.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonH.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonI.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonJ.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonK.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonL.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==4){
            keyboardView.buttonM.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonN.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonO.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonP.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonQ.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonR.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==5){
            keyboardView.buttonS.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonT.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonU.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonV.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonW.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonX.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==6){
            keyboardView.buttonY.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonZ.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button0.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button1.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button2.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button3.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==7){
            keyboardView.button4.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button5.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button6.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button7.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button8.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button9.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==8){
            keyboardView.sug1.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.butbackspace.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonA.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonG.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonM.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonS.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonY.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button4.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==9){
            keyboardView.sug1.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.butbackspace.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonB.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonH.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonN.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonT.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonZ.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button5.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==10){
            keyboardView.sug2.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.butspace.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonC.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonI.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonO.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonU.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button0.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button6.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==11){
            keyboardView.sug2.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.butspace.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonD.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonJ.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonP.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonV.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button1.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button7.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==12){
            keyboardView.sug3.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.butreturn.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonE.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonK.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonQ.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonW.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button2.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button8.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        if (r==13){
            keyboardView.sug3.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor.white
            keyboardView.butreturn.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonF.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonL.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonR.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.buttonX.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button3.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            keyboardView.button9.backgroundColor = intensifying ? UIColor(named: "foreground") : UIColor(named: "background")
            
        }
        

        
        
        timecount+=1
        
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            timecount = 0
        if (timer != nil){
            timer?.invalidate()
            timer = nil
        }
            self.view.endEditing(true)
            return false
        
        }
    
   
}
