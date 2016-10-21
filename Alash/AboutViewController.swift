//
//  AboutViewController.swift
//  Alash
//
//  Created by Admin on 9/21/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    let screenBounds = UIScreen.mainScreen().bounds
    
    var textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        self.edgesForExtendedLayout = .None
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: screenBounds.width*0.05)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        self.automaticallyAdjustsScrollViewInsets = true
        
        title = "Алаш"

        setup()
    }


    func setup() {
        
    
        textView = UITextView(frame: CGRect(x: screenBounds.width*0.05, y: 10, width: screenBounds.width*0.9, height: screenBounds.height*0.9))
        textView.textColor = UIColor.whiteColor()
        textView.backgroundColor = UIColor.clearColor()
        textView.textAlignment = .Center
        textView.scrollEnabled = true
        textView.font = UIFont(name: "Helvetica-Light", size: screenBounds.width * 0.05)
        textView.text = "Алаш партиясы мүшелері Алаш Орда үкіметінің құрамында барынша көпшілігі болған.[2] Тарихты халық жасағанымен, қоғамның тарихи даму заңдылықтарын реттеп отыратын заңдар мен құқықтық құжаттарды, саяси-құқықтық доктриналарды нақты тұлғалар жүзеге асыратыны белгілі, осы салада мемлекеттік тілдің де атқарар қызметі зор. Қазақ жері екі ғасырдан астам Ресей самодержавасының қол астында болған жылдарда, қазақ халқының өз тағдырын өзі билеу құқығынан айырғаны, көк түрік дәуірінен бастау алған бірегей саяси тарихы бар халық, түгелдей империялық заңдардың бұғауына түскені, біздерге тарихтан белгілі. Қазақ қоғамының осы бір қасіретін халықтың озық ойлы, көзі ашық өкілдері аңғара бастады. Олар халықты саяси күрес додасына бастап шықты. Бұған себеп болған 1917 жылғы Ресейдегі қос төңкеріс еді. Патша үкіметінің тақтан құлауы саяси күресті одан әрі қыздыра түсті. Қазақ зиялылары саяси қызметтің қатерлі жолына жалтақтамай, жанқиярлықпен күрескен көрнекті тұлғалар шықты. Олар: Ә.Бөкейханов, А.Байтұрсынов, М.Дулатов, Ж.Ақбаев, Ә.Ермеков, Х.Досмұхамедов, Ж.Досмұхамедов және т.б. болатын. Олар патша самодержавасының қазақ халқының саяси-сезімінің қалыптасып, оның саяси күреске ұласуына, барынша кедергі келтіріп отырғанын бірден түсінген еді."
        self.view.addSubview(textView)
    }
    
}
