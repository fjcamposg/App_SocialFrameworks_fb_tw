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
        } else {
            print("error de fb , la cuenta no esta habilitada")
        }
    }
    
    
    @IBAction func postTwitterAction(_ sender: Any) {
    }
    
    @IBAction func showPickerPhoto(_ sender: Any) {
    }
    
    @IBAction func showActivitiesSheetAction(_ sender: Any) {
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


}

