//
//  UIViewController_OppnaSinnen.swift
//  fontTest
//
//  Created by Kristin Vågberg on 2019-02-18.
//  Copyright © 2018 Kristin Vågberg. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController_KomIgang: UIViewController {
    
    @IBOutlet weak var SliderVilaMotTrad: UISlider!
    
    @IBOutlet weak var CurrentTidd: UILabel!
    @IBOutlet weak var MaxTid: UILabel!
    @IBOutlet weak var PlayStopButton: UIButton!
    
    //var ChangeButton
    var ChangeButton = 1
    //musicplayer
    var musicEffectVilaMotTrad: AVAudioPlayer!
    //var musicEffectVilaMotTrad:  AVAudioPlayer = AVAudioPlayer()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //for att knappen ska bytas ut första ggn till highlighted state.
        PlayStopButton.setImage(UIImage(named: "play.png"), for: UIControl.State.highlighted)
        
        let musicFileVilaMotTrad = Bundle.main.path(forResource: "AppIntro", ofType: ".mp3")
        
        //for att ljudet ska spelas trots att skarmen last sig
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
        do {
            
            try musicEffectVilaMotTrad = AVAudioPlayer(contentsOf: URL (fileURLWithPath: musicFileVilaMotTrad!))
            //maximumvalue maste ligga efter deklrationen av musiceffectVilamottrad
            SliderVilaMotTrad.maximumValue = Float(musicEffectVilaMotTrad.duration)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        }
            
        catch {
            print(error)
        }
    }
    
    //NÄR SIDAN LADDAS SÅ VILL VI VISA NAVIGATIONSBAREN - TOG JU BORT DEN PÅ FÖRSTA SIDAN!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    //NÄR VIEWN FÖRSVINNER IGEN - STOPPA LJUDET, SÅ DET INTE FORTSÄTTER ATT SPELAS!
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        musicEffectVilaMotTrad.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PlayKannEttTrad(_ sender: Any) {
        
        
        if ChangeButton == 1  {
            musicEffectVilaMotTrad.play()
            SliderVilaMotTrad.value = Float(musicEffectVilaMotTrad.currentTime)
            PlayStopButton.setImage(UIImage(named: "stop.png"), for: UIControl.State.normal)
            //pressed button om vi vill ha det
            PlayStopButton.setImage(UIImage(named: "stop.png"), for: UIControl.State.highlighted)
            
            ChangeButton = 0
        }
        else {
            musicEffectVilaMotTrad.stop()
            PlayStopButton.setImage(UIImage(named: "play.png"), for: UIControl.State.normal)
            //pressed button om vi vill ha det
            PlayStopButton.setImage(UIImage(named: "play.png"), for: UIControl.State.highlighted)
            ChangeButton = 1
            
        }
    }
    
    
    
    //EGEN TILLBAKA PIL - STOPPAR MUSIKEN NÄR MAN TRYCKT PÅ PILEN
    // @IBAction func BackVilaMotTrad(_ sender: Any) {
    //   musicEffectVilaMotTrad.stop()
    // }
    
    //changeAudioTime - nar man drar i slidern
    @IBAction func ChangeAudioTime(_ sender: Any) {
        musicEffectVilaMotTrad.stop()
        PlayStopButton.setImage(UIImage(named: "stop.png"), for: UIControl.State.normal)
        ChangeButton = 1
        musicEffectVilaMotTrad.currentTime = TimeInterval(SliderVilaMotTrad.value)
    }
    
    @objc func updateSlider(){
        //update slider
        SliderVilaMotTrad.value = Float(musicEffectVilaMotTrad.currentTime)
        //update currenttime
        //   CurrentTidd.text = String(musicEffectVilaMotTrad.currentTime)
        // kopierat fran https://stackoverflow.com/questions/13264939/how-to-get-duration-hhmmss-from-avaudioplayer-in-iphone och sedan vid fel automatfixat dem! hurra!!
        CurrentTidd.text = String(format: "%02d:%02d", ((Int)((musicEffectVilaMotTrad.currentTime))) / 60, ((Int)((musicEffectVilaMotTrad.currentTime))) % 60)
        
    }
}
























