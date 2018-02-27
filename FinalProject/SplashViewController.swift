//
//  SplashViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-23.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    var timer = Timer();
    var seconds = 5;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showProgress), userInfo: nil, repeats: true);
        
    }
    
    @objc func showProgress()
    {
        seconds -= 1;
        progressView.progress += 0.2;
        
        if seconds == 0
        {
            timer.invalidate();
            showLogin();
        }
    }
    
    func showLogin()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC");
        self.present(viewController, animated: true, completion: nil);
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
