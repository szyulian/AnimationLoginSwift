//
//  ViewController.swift
//  AnimationLoginSwiftView
//
//  Created by YuLian on 11/4/15.
//  Copyright © 2015 LianYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    enum LogingAnimationType{
        case LogingAnimationType_NONE
        case LogingAnimationType_USER
        case LogingAnimationType_PWD
    };
    
    var imgLeftHand: UIImageView?;
    var imgRightHand: UIImageView?;
    
    var imgLeftHandGone: UIImageView?;
    var imgRightHandGone: UIImageView?;
    
    var AnimationType: LogingAnimationType?;
    
    override func viewDidLoad() {
        self.UISetting()
        PasswordTextField.delegate = self
        UserNameTextField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBOutlet weak var right_hidden: UIImageView!
    @IBOutlet weak var left_hidden: UIImageView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var left_look: UIImageView!
    @IBOutlet weak var right_look: UIImageView!
    
    func UISetting(){
        AnimationType = LogingAnimationType.LogingAnimationType_NONE;
        
        let boColor: UIColor = UIColor.init(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/225.0, alpha: 100)
        
        
        UserNameTextField.layer.borderColor = boColor.CGColor;
        UserNameTextField.leftView = UIView.init(frame: CGRectMake(0, 0, 44, 44))
        UserNameTextField.leftViewMode = UITextFieldViewMode.Always
        let imgUser: UIImageView = UIImageView.init(frame: CGRectMake(11, 11, 22, 22))
        imgUser.image = UIImage(named: "iconfont-user")
        UserNameTextField.leftView!.addSubview(imgUser)
        
        PasswordTextField.layer.borderColor = boColor.CGColor;
        PasswordTextField.leftView = UIView.init(frame: CGRectMake(0, 0, 44, 44))
        PasswordTextField.leftViewMode = UITextFieldViewMode.Always
        let imgPwd: UIImageView = UIImageView.init(frame: CGRectMake(11, 11, 22, 22))
        imgPwd.image = UIImage(named:"iconfont-password")
        PasswordTextField.leftView!.addSubview(imgPwd);
        
        loginView.layer.borderColor = boColor.CGColor;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField.isEqual(PasswordTextField) {
            AnimationType = LogingAnimationType.LogingAnimationType_PWD;
            self.AnimationUserToPassword()
        }else{
            if AnimationType == LogingAnimationType.LogingAnimationType_NONE {
                AnimationType = LogingAnimationType.LogingAnimationType_USER;
                return;
            }
            AnimationType = LogingAnimationType.LogingAnimationType_USER;
            self.AnimationPasswordToUser();
            
        }
    }
    
    func AnimationUserToPassword(){
        UIView.animateWithDuration(0.5, animations: {
            self.left_look.frame = CGRectMake(self.left_look.frame.origin.x + 80, self.left_look.frame.origin.y, 0, 0);
            self.right_look.frame = CGRectMake(self.right_look.frame.origin.x - 40, self.right_look.frame.origin.y, 0, 0);
            self.right_hidden.frame = CGRectMake(self.right_hidden.frame.origin.x-55, self.right_hidden.frame.origin.y-40, 40, 66);
            self.left_hidden.frame = CGRectMake(self.left_hidden.frame.origin.x+60, self.left_hidden.frame.origin.y-40, 40, 66);
        
        })
    }
    
    func AnimationPasswordToUser(){
        UIView.animateWithDuration(0.5, animations: {
            
            self.left_look.frame = CGRectMake(self.left_look.frame.origin.x - 80, self.left_look.frame.origin.y, 40, 40);
            self.right_look.frame = CGRectMake(self.right_look.frame.origin.x + 40, self.right_look.frame.origin.y, 40, 40);
            
            self.right_hidden.frame = CGRectMake(self.right_hidden.frame.origin.x+55, self.right_hidden.frame.origin.y+40, 40, 66);
            self.left_hidden.frame = CGRectMake(self.left_hidden.frame.origin.x-60, self.left_hidden.frame.origin.y+40, 40, 66);
            
            });
    }
    @IBAction func EndEditTap(sender: UITapGestureRecognizer) {
        if (AnimationType == LogingAnimationType.LogingAnimationType_PWD) {
            self.AnimationPasswordToUser();
        }
        AnimationType = LogingAnimationType.LogingAnimationType_NONE;
        self.view.endEditing(true);
    }
}

