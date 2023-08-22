//
//  sonucEkraniVC.swift
//  SayiTahmini
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit

class sonucEkraniVC: UIViewController {
    @IBOutlet weak var faceView: UIImageView!
    
    @IBOutlet weak var alertLabel: UILabel!
    
    // Kod üzerinde hangi alanın gelmesi gerektiğini buradan belirlemiş oluyoruz.
    var sonuc: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Kod üstünde bulunan geri dönüş button'nun kaldırdık.
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç Ekranı"
        
        print(sonuc!)
        
        //Sonuçlar doğrultusunde hangi image ve text yazacağını belirlemiş olduk.
        if sonuc! {
            alertLabel.text = "Kazandınız."
            faceView.image = UIImage(named: "mutlu_resim")
        }else {
            alertLabel.text = "Kaybettiniz."
            faceView.image = UIImage(named: "uzgun_resim")
        }
        
        
        
    }
    @IBAction func tekrarOyna(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
