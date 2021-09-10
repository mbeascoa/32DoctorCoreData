//
//  DoctorListControllerViewController.swift
//  32DoctorCoreData
//
//  Created by mbeascoa on 10/9/21.
//

import UIKit
import CoreData


class DoctorListControllerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var doctores:[String] = []
    
    override func viewDidLoad() {
    super.viewDidLoad()
    if let miDelegate = UIApplication.shared.delegate as? AppDelegate{
    let miContexto = miDelegate.persistentContainer.viewContext
    //LECTURA DE DATOS
    let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName:"Doctor")
    if let nombresClientes = try? miContexto.fetch(request) as? [NSManagedObject] {
    for dato in nombresClientes {
        doctores.append(dato.value(forKey: "surname") as! String)
        
    }
        
    }
    
}
    
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return doctores.count
    
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
    cell.textLabel?.text = doctores[indexPath.row]
        return cell }

}

 

 
