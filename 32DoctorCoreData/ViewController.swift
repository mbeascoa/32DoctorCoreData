//
//  ViewController.swift
//  32DoctorCoreData
//
//  Created by mbeascoa on 10/9/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var etMainDoctorNum: UITextField!
    @IBOutlet weak var etMainSurname: UITextField!
    @IBOutlet weak var etMainHospitalCod: UITextField!
    @IBOutlet weak var etMainSpeciality: UITextField!
    @IBOutlet weak var etMainSalary: UITextField!
    @IBOutlet weak var tvMainError: UILabel!
    
    @IBAction func saveDoctor(_ sender: Any) {
        if(isValidForm()){
            if let miDelegate = UIApplication.shared.delegate as? AppDelegate{
                
                let miContexto = miDelegate.persistentContainer.viewContext
                let nuevoNombre = NSEntityDescription.insertNewObject(forEntityName: "Doctor",into: miContexto)
                nuevoNombre.setValue(Int(etMainDoctorNum.text!)!, forKey: "doctorNum")
            nuevoNombre.setValue(Int(etMainHospitalCod.text!)!, forKey: "hospitalCod")
            nuevoNombre.setValue(Float(etMainSalary.text!)!, forKey: "salary")
                nuevoNombre.setValue(etMainSpeciality.text, forKey: "speciality")
                nuevoNombre.setValue(etMainSurname.text, forKey: "surname")
                do{
                    try
                        miContexto.save()
                    tvMainError.textColor = UIColor.black
                    tvMainError.text = "Guardado correctamente"
                    
                }catch{
                    tvMainError.textColor = UIColor.red
                    tvMainError.text = "\(error)"
                    
                }
                
            }
            
        }else{
            tvMainError.textColor = UIColor.red
            tvMainError.text = "Complete todos los campos"
            
        }
        
    }
    func isValidForm()->Bool{
        var isValid:Bool = false
        if(!etMainDoctorNum.text!.isEmpty && !etMainHospitalCod.text!.isEmpty && !etMainSalary.text!.isEmpty && !etMainSpeciality.text!.isEmpty && !etMainSurname.text!.isEmpty){isValid = true}
        return isValid
        
    }
    

override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}



