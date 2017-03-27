//
//  ViewController.swift
//  App_SocialFrameworks_fb_tw
//
//  Created by cice on 22/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import Social

class FTPostViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var miImagen: UIImageView!
    @IBOutlet weak var miTexto: UILabel!
    
    // MARK: -Actions
    
    
    @IBAction func postFacebookAction(_ sender: Any) {
        // 1 -> comprobamos disponibilidad del framwork
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            // 2 -> creamos el objeto
            let postFbData = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            postFbData?.setInitialText(miTexto.text!)
            postFbData?.add(miImagen.image!)
            postFbData?.add(URL(string: "http://www.andresocampo.com"))
            present(postFbData!, animated: true, completion: nil)
            print("se ha publicado")
            limpiarDatos()
            
        } else {
            // print("error de fb , la cuenta no esta habilitada")
            present(muestraAlerVC("Estimado usuario", messageData: "error de fb , la cuenta no esta habilitada", titleAction: "OK"), animated: true, completion: nil)
        }
    }
    
    
    @IBAction func postTwitterAction(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            // 2 -> creamos el objeto
            let postTwterData = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            postTwterData?.setInitialText(miTexto.text!)
            postTwterData?.add(miImagen.image!)
            postTwterData?.add(URL(string: "http://www.andresocampo.com"))
            present(postTwterData!, animated: true, completion: nil)
            print("se ha publicado")
            limpiarDatos()
            
        } else {
            // print("error de twitter , la cuenta no esta habilitada")
            present(muestraAlerVC("Estimado usuario", messageData: "error de Twitter , la cuenta no esta habilitada", titleAction: "OK"), animated: true, completion: nil)
        }

    
    }
    
    
    
    @IBAction func showPickerPhoto(_ sender: Any) {
        pickerPhoto()
    }
    
    @IBAction func showActivitiesSheetAction(_ sender: Any) {
        // let miModel = model[sender.tag].nombreid
        
        let textoCompartir = miTexto.text
        let webCompartir = "mi modelo de datos.nombreid" + "http://google.es"
        let imagenCompartir = miImagen.image
        
        let compartirAVC = UIActivityViewController(activityItems: [textoCompartir!, webCompartir, imagenCompartir!], applicationActivities: nil)
        present(compartirAVC, animated: true, completion: nil)
        limpiarDatos()
        
        
        
    }
    
    
    @IBAction func showNewComentaryAction(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UTIls
    
    func limpiarDatos(){
        miTexto.text = ""
        miImagen.image = #imageLiteral(resourceName: "placehoder")
    }
    

}

extension FTPostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            muestraMenu()
        } else {
            muestraLibreriaFotos()
        }
    }
    
    func muestraMenu(){
        let alertVC = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let tomaFotoAction = UIAlertAction(title: "Toma foto", style: .default) { _ in
            self.muestraCamara()
        }
        
        let seleccionaLibreria = UIAlertAction(title: "Selecciona de la libreria", style: .default) {
            _ in
            self.muestraLibreriaFotos()
            
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(tomaFotoAction)
        alertVC.addAction(seleccionaLibreria)
        present(alertVC, animated: true, completion: nil)
    }
    
    func muestraCamara(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func muestraLibreriaFotos(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            miImagen.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
