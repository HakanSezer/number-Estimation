//
//  tahminEkran.swift
//  SayiTahmini
//
//  Created by Hakan Sezer on 22.08.2023.
//

import UIKit

class tahminEkran: UIViewController {
    @IBOutlet weak var yonlendirmeLabel: UILabel!
    
    @IBOutlet weak var kalanHakLabel: UILabel!
    
    @IBOutlet weak var girdiTextField: UITextField!
    
    // Değişkenlerimiz. Bu bölümde oyunda ne kadar hakkın olduğunu belirleniyor.
    var kalan = 5
    var rasgeleSayi: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rasgele Sayi Başlangıç Kodu
        rasgeleSayi = Int.random(in: 0...10)
        print("Rasgele Sayi \(rasgeleSayi!)")
        
        kalanHakLabel.text = String("Kalan Tahmin: \(kalan)")
    }
    @IBAction func tahminEtButton(_ sender: Any) {
        yonlendirmeLabel.isHidden = false
        kalan -= 1
        
        // Tahmin mantığı Kodu
        if let tahmin = girdiTextField.text {
            if let sayi = Int(tahmin) {
                if kalan != 0 {
                    if sayi == rasgeleSayi! {
                        //Doğru Olan.
                        //Sayfa geçişi
                        let sonuc = true
                        performSegue(withIdentifier: "yeniOyun", sender: sonuc)
                    }
                    if sayi > rasgeleSayi! {
                        // Düşür.
                        yonlendirmeLabel.text = "Azalt"
                    }
                    if sayi < rasgeleSayi! {
                        yonlendirmeLabel.text = "Arttır."
                    }
                }else {
                    let sonuc = false
                    performSegue(withIdentifier: "yeniOyun", sender: sonuc)
                }
            }
        }
        
        //MARK: Switch
        switch kalan {
        case 1:
            kalanHakLabel.text = "Kalan Tahmin: 1"
        case 2:
            kalanHakLabel.text = "Kalan Tahmin: 2"
        case 3:
            kalanHakLabel.text = "Kalan Tahmin: 3"
        case 4:
            kalanHakLabel.text = "Kalan Tahmin: 4"
        default:
            kalanHakLabel.text = "Kalan Tahmin: 5"
        }
        
        
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "yeniOyun" {
            // Consol Test
            print("B'ye geçiş oldu.")
            
                if let veri = sender as? Bool {
                    let gidilecekVC = segue.destination as! sonucEkraniVC
                    gidilecekVC.sonuc = veri
            }
        }
    }
}
