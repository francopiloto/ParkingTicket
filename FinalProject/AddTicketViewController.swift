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
    @IBOutlet weak var lblCurrentDate: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    
    @IBOutlet weak var txtVehicleNumber: UITextField!
    @IBOutlet weak var txtVehicleBrand: UITextField!
    @IBOutlet weak var txtVehicleColor: UITextField!
    @IBOutlet weak var txtParkingTime: UITextField!
    @IBOutlet weak var txtParkingLane: UITextField!
    @IBOutlet weak var txtParkingSpot: UITextField!
    @IBOutlet weak var txtPaymentMethod: UITextField!
    
    @IBOutlet weak var imgMakerLogo: UIImageView!
    
    private var data = [TickedData]();
    private var selectedComponent = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss";
        lblCurrentDate.text = dateFormatter.string(from: Date());
        
        lblCost.layer.borderWidth = 3.0;
        lblCost.layer.cornerRadius = 8;
        lblCost.layer.borderColor = UIColor(red: CGFloat(169), green: CGFloat(53), blue: CGFloat(41), alpha: CGFloat(1.0)).cgColor;
        
        data.append(TickedData(txt:txtVehicleBrand, options:["Acura","Alfa-Romeo","Audi","Bentley","BMW","Buick","Cadillac","Chevrolet","Dodge","Ferrari","Fiat","Ford", "GMC","Honda","Hyundai","Infiniti","Jaguar","KIA","Lamborghini","Land-Rover","Mercedes-Benz","Mini-Cooper","Nissan","Porsche","Ram","Rolls-Royce","Subaru","Tesla","Toyota","Volkswagen"], onChange:
            {
                (selected:Int) in
                    let maker = self.data[self.selectedComponent].options[selected];
                    self.imgMakerLogo.image = UIImage(named: maker.lowercased() + ".png");
            }));
        
        data.append(TickedData(txt:txtVehicleColor, options:["White","Purple","White Diamond Pearl","Silver","Red","Black","Grey","Blue","Brown"], onChange: nil));
        data.append(TickedData(txt:txtParkingTime, options:["1/2 Hr.", "1 Hr.", "2 Hr.", "3 Hr.", "Day Ends"], onChange:
            {
                (selected:Int) in
                let prices = [5.00,7.25,8.50,10.00,15.00];
                self.lblCost.text = String(format: "$ %.02f", prices[selected]);
            }));
        
        data.append(TickedData(txt:txtParkingLane, options:["Lane A", "Lane B","Lane C","Lane D","Lane E"], onChange: nil));
        data.append(TickedData(txt:txtParkingSpot, options:["P1","P2","P3","P4","P5","P6","P7","P8"], onChange: nil));
        data.append(TickedData(txt:txtPaymentMethod, options:["Credit Card", "Debit Card", "Cash"], onChange: nil));
        
        for index in 0...data.count - 1
        {
            data[index].txt.delegate = self;
            data[index].txt.tag = index;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func btnSaveClick(_ sender: UIBarButtonItem)
    {
        if valid() {
            
        }
    }
    
    private func showOptions(_ textField:UITextField)
    {
        let pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: view.frame.size.width, height: 160));
        
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.backgroundColor = UIColor.white;
        textField.inputView = pickerView;
        
        pickerView.selectRow(data[selectedComponent].selected, inComponent: 0, animated: true);
        selectOption(option: data[selectedComponent].selected);
    }
    
    private func selectOption(option:Int) {
        data[selectedComponent].select(index: option);
    }
    
    private func valid() -> Bool
    {
        return true;
    }
}

extension AddTicketViewController : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        selectedComponent = textField.tag;
        showOptions(textField);
    }
}

extension AddTicketViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[selectedComponent].options[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectOption(option: row);
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
    var onChange: ((Int)->Void)?;
    
    init(txt:UITextField, options:[String], onChange: ((Int)->Void)?)
    {
        self.txt = txt;
        self.options = options;
        self.onChange = onChange;
    }
    
    func select(index:Int)
    {
        txt.text = options[index];
        selected = index;
        
        if onChange != nil {
            onChange!(selected);
        }
    }
}
