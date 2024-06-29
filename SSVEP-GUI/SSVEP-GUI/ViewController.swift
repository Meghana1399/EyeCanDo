//
//  ViewController.swift
//  SSVEP-GUI
//
//  Created by Fatemeh on 11/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonH: UIButton!
    @IBOutlet weak var buttonI: UIButton!
    
    
    
    
    
    let mycolors = ["myblue", "myred"]
    let pers = [4, 5, 6, 7, 8]
    var lettersord = [1, 3, 4, 5, 7]
    var keycolors = [1, 1, 1, 1, 1]
    
    var cnt = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDisplayLink()
    }
    
    func createDisplayLink() {
        let displaylink = CADisplayLink(target: self,
                                        selector: #selector(step))
        
        displaylink.add(to: .current,
                        forMode: RunLoop.Mode.default)
    }
    
    @objc func step(displaylink: CADisplayLink) {
        
        
        //        print(displaylink.targetTimestamp)
        if (cnt%300 < 60){
            print("salam")
            
            buttonB.backgroundColor = UIColor(named: "mygray")
            buttonD.backgroundColor = UIColor(named: "mygray")
            buttonE.backgroundColor = UIColor(named: "mygray")
            buttonF.backgroundColor = UIColor(named: "mygray")
            buttonH.backgroundColor = UIColor(named: "mygray")
            print(lettersord, cnt/300)
            print(cnt)
            let redind = lettersord[cnt/300]
            print(redind)
            if (redind == 1){
                buttonB.backgroundColor = UIColor(named: "myred")
            }
            if (redind == 3){
                buttonD.backgroundColor = UIColor(named: "myred")
            }
            if (redind == 4){
                buttonE.backgroundColor = UIColor(named: "myred")
            }
            if (redind == 5){
                buttonF.backgroundColor = UIColor(named: "myred")
            }
            if (redind == 7){
                buttonH.backgroundColor = UIColor(named: "myred")
            }
            
        }
        else{
            buttonB.backgroundColor = UIColor(named: "mygray")
            buttonD.backgroundColor = UIColor(named: "mygray")
            buttonE.backgroundColor = UIColor(named: "mygray")
            buttonF.backgroundColor = UIColor(named: "mygray")
            buttonH.backgroundColor = UIColor(named: "mygray")
            let cnt2 = cnt%300
            if (cnt2%pers[0] > pers[0]/2){
                buttonB.backgroundColor = UIColor(named: "lettercolor")
                
            }
            if (cnt2%pers[1] > pers[1]/2){
                buttonD.backgroundColor = UIColor(named: "lettercolor")
                
            }
            if (cnt2%pers[2] > pers[2]/2){
                buttonE.backgroundColor = UIColor(named: "lettercolor")
                
            }
            if (cnt2%pers[3] > pers[3]/2){
                buttonF.backgroundColor = UIColor(named: "lettercolor")
                
            }
            if (cnt2%pers[4] > pers[4]/2){
                buttonH.backgroundColor = UIColor(named: "lettercolor")
                
            }
            
        }
        cnt+=1
        if (cnt==1500){
            cnt = 0
            lettersord = lettersord.shuffled()
            
        }
        
    }
    
    
    @IBAction func buttonAclicked(_ sender: Any) {
       
       print("salam")
    }
    
    
    
    
}

