//
//  InstructionViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-26.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var myInstructionView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFile()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFile()
    {
        let localfilePath = Bundle.main.url(forResource: "instruction", withExtension: "html");
        let myRequest = NSURLRequest(url: localfilePath!);
        myInstructionView.loadRequest(myRequest as URLRequest);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
