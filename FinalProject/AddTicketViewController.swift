//
//  AddTicketViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-26.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class AddTicketViewController: UIViewController
{
    @IBOutlet weak var txtVehicleNumber: UITextField!
    @IBOutlet weak var txtVehicleBrand: UITextField!
    @IBOutlet weak var txtColor: UITextField!
    @IBOutlet weak var txtTiming: UITextField!
    @IBOutlet weak var txtLane: UITextField!
    
    
    private var data = [TickedData]();
    private var selectedIndex = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        data.append(TickedData(txt:txtVehicleBrand, options:["BMW","Bulk","Chevrolet","Chrysler","Dodge","Ferrary","Ford","GMC","Honda","Hyundai","Jaguar","KIA","Lamborghini","LandHover","Mercedes","Porsche","Toyota"]));
        
        for index in 0...data.count - 1
        {
            data[index].txt.delegate = self;
            data[index].txt.tag = index;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    private func showOptions(_ textField:UITextField)
    {
        let pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: view.frame.size.width, height: 216));
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.backgroundColor = UIColor.white;
        textField.inputView = pickerView;
    }
}

extension AddTicketViewController : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        selectedIndex = textField.tag;
        
        if textField.text == nil || (textField.text?.isEmpty)! {
            textField.text = data[selectedIndex].options[0];
        }
        
        showOptions(textField);
    }
}

extension AddTicketViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[selectedIndex].options[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data[selectedIndex].txt.text = data[selectedIndex].options[row];
    }
}

extension AddTicketViewController : UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[selectedIndex].options.count;
    }
}

fileprivate class TickedData
{
    var txt:UITextField;
    var options:[String];
    
    init(txt:UITextField, options:[String])
    {
        self.txt = txt;
        self.options = options;
    }
}
