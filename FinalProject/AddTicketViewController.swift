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
    @IBOutlet weak var imgMakerLogo: UIImageView!
    
    
    private var data = [TickedData]();
    private var selectedComponent = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        data.append(TickedData(txt:txtVehicleBrand, options:["Acura",  "Alfa-Romeo", "Audi", "Bentley", "BMW","Buick","Cadillac","Chevrolet","Dodge","Ferrari","Fiat","Ford", "GMC","Honda","Hyundai","Infiniti","Jaguar","KIA","Lamborghini","Land-Rover","Mercedes-Benz","Mini-Cooper","Nissan","Porsche","Ram","Rolls-Royce","Subaru","Tesla","Toyota","Volkswagen"]));
        
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
        pickerView.selectRow(data[selectedComponent].selected, inComponent: 0, animated: true);
        
        textField.inputView = pickerView;
    }
}

extension AddTicketViewController : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        selectedComponent = textField.tag;
        
        if textField.text == nil || (textField.text?.isEmpty)!
        {
            //let maker = data[selectedIndex].options[0];
            //textField.text = maker;
            //imgMakerLogo.image = UIImage(named: maker.lowercased() + ".png");
        }
        
        showOptions(textField);
    }
}

extension AddTicketViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[selectedComponent].options[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data[selectedComponent].select(index: row);
        
        let maker = data[selectedComponent].options[row];
        imgMakerLogo.image = UIImage(named: maker.lowercased() + ".png");
    }
}

extension AddTicketViewController : UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[selectedComponent].options.count;
    }
}

fileprivate class TickedData
{
    var txt:UITextField;
    var options:[String];
    var selected = 0;
    
    init(txt:UITextField, options:[String])
    {
        self.txt = txt;
        self.options = options;
    }
    
    func select(index:Int)
    {
        txt.text = options[index];
        selected = index;
    }
}
