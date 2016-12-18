//
//  ViewController.swift
//  KVLHelpers
//
//  Created by Misha Koval on 9/19/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setBgColorForView(self.view)
        
        addRotatedViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setBgColorForView(_ view: UIView)
    {
        view.backgroundColor = RandomColor()
        
        let colorComponents = (self.view.backgroundColor?.cgColor)!.components;
        let red     = colorComponents?[0];
        let green   = colorComponents?[1];
        let blue    = colorComponents?[2];
        let alpha   = colorComponents?[3];
        
        let colorLabel = UILabel();
        
        colorLabel.text = String(format:"BGColor: RGBA{%.0f,%.0f,%.0f,%.0f}", red! * 255, green! * 255, blue! * 255, alpha! * 255);
        colorLabel.adjustsFontSizeToFitWidth = true;
        colorLabel.sizeToFit();
        colorLabel.textAlignment = .center;
        colorLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: view.size.width - 20,
            height: colorLabel.size.height);
        
        view.addSubviewAtCenterHorizontally(colorLabel, originY: 20);
    }
    
    func addRotatedViews()
    {
        let viewSize: CGFloat = 150.0;
        let leftView = UIView(frame: CGRect(
            x: self.view.size.width / 2 - viewSize,
            y: self.view.size.height / 2 - viewSize / 2,
            width: viewSize,
            height: viewSize))
        let rightView = UIView(frame: CGRect(
            x: self.view.size.width / 2,
            y: self.view.size.height / 2 - viewSize / 2,
            width: viewSize,
            height: viewSize))
        
        setBgColorForView(leftView)
        setBgColorForView(rightView)
        
        leftView.rotateByDegrees(-45.0)
        rightView.rotateByDegrees(45.0)
        
        self.view.addSubview(leftView)
        self.view.addSubview(rightView)
    }
}

