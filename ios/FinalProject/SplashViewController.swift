//
//  SplashViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-23.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController
{
    @IBOutlet weak var progressView: UIProgressView!
    
    var timer = Timer();
    var seconds = 5;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
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
        super.didReceiveMemoryWarning();
    }
}
