//
//  WriteViewController.swift
//  iEum
//
//  Created by 황수빈 on 18/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var subtitleTextField: UITextField!
    @IBOutlet var explainTextField: UITextView!
    var imageList : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
        titleTextField.delegate = self
        subtitleTextField.delegate = self
        explainTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        if textField == self.titleTextField {
            textField.resignFirstResponder()
            self.subtitleTextField.becomeFirstResponder()
        }
        else if textField == self.subtitleTextField {
            textField.resignFirstResponder()
            self.explainTextField.becomeFirstResponder()
            self.explainTextField.text = ""
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func selectPic(_ sender: UIButton) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        myPicker.sourceType = .photoLibrary
        self.present(myPicker, animated: true, completion: nil)
    }
    
    func imagePickerController (_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageList.append(image)
            collectionView.reloadData()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel (_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        appDelegate.my = 1
        
        if titleTextField.text == "" {
            simpleAlert(title: "제목을 입력하세요.", message: " "); return;
        }
        if subtitleTextField.text == "" {
            simpleAlert(title: "주제를 입력하세요.", message: " "); return;
        }
        if explainTextField.text == "" {
            simpleAlert(title: "설명을 입력하세요.", message: " "); return;
        }
        
        let work = Work(workIdx: 21, title: "\(titleTextField.text!)", subTitle: "\(subtitleTextField.text!)", workName: "mainImg21", subName: "subRed")
        appDelegate.workList.append(work)
        
        let detail = Detail(workIdx: 21, explanation: "\(explainTextField.text!)", workName: "subSubRed")
        appDelegate.detailList.append(detail)
        
        self.simpleAlert(title: "저장 성공", message:" ")
    }
}

extension WriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
            cell.imageView!.image = self.imageList[indexPath.row]
            return cell
    }
}

extension WriteViewController: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.titleTextField.resignFirstResponder()
        self.subtitleTextField.resignFirstResponder()
        self.explainTextField.resignFirstResponder()
    }
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: titleTextField))! || (touch.view?.isDescendant(of: subtitleTextField))! {
            return false
        }
        return true
    }
}
