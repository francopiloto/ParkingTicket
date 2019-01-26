//
//  InstructionViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-26.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController
{
    @IBOutlet weak var myInstructionView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadFile();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    func loadFile()
    {
        let localfilePath = Bundle.main.url(forResource: "instruction", withExtension: "html");
        let myRequest = NSURLRequest(url: localfilePath!);
        myInstructionView.loadRequest(myRequest as URLRequest);
    }
}
