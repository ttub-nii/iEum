//
//  WriteViewController.swift
//  iEum
//
//  Created by 황수빈 on 18/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var mainTitle: UITextField!
    @IBOutlet var subTitle: UITextField!
    @IBOutlet var explanation: UITextView!
    
    var imageList : [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        initGestureRecognizer()
        setNavigationBarClear()
//        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationBar.shadowImage = UIImage()
//        navigationBar.isTranslucent = false
    }
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        if textField == self.mainTitle {
            textField.resignFirstResponder()
            self.subTitle.becomeFirstResponder()
        }
        else if textField == self.subTitle {
            textField.resignFirstResponder()
            self.explanation.becomeFirstResponder()
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
    
    // 앨범에서 이미지 선택을 위한 함수
    func imagePickerController (_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // self.imageView.image = image
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
        print("write detailList", appDelegate.detailList.count)
        
        // 옵셔널 검사
        if mainTitle.text == "" {
            simpleAlert(title: "제목을 입력하세요.", message: " "); return;
        }
        if subTitle.text == "" {
            simpleAlert(title: "주제를 입력하세요.", message: " "); return;
        }
        if explanation.text == "" {
            simpleAlert(title: "설명을 입력하세요.", message: " "); return;
        }
        
        let work21 = Work(workIdx: 21, title: "\(mainTitle.text!)", subTitle: "\(subTitle.text!)", workName: "mainImg21", subName: "subRed")
        appDelegate.workList.append(work21)
        
        let detail21 = Detail(workIdx: 21, explanation: "\(explanation.text!)", workName: "subSubRed")
        appDelegate.detailList.append(detail21)
        print("write detailList", appDelegate.detailList.count)
        
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

// 키보드 때문에 가려지지 않게 조정하는 extension
extension WriteViewController: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.mainTitle.resignFirstResponder()
        self.subTitle.resignFirstResponder()
        self.explanation.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: mainTitle))! || (touch.view?.isDescendant(of: subTitle))! {
            
            return false
        }
        return true
    }
}
