//
//  SubViewController.swift
//  iEum
//
//  Created by 황수빈 on 16/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    @IBOutlet var replyTable: UITableView!
    @IBOutlet var replyBtn: UIButton!
    @IBOutlet var workImgView: UIImageView!
    @IBOutlet var workTitle: UILabel!
    @IBOutlet var workSubTitle: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var viewlikeText: UIView!
    @IBOutlet var replyView: UIView!
    @IBOutlet var replyText: UITextField!
    @IBOutlet var detailCV: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var replyList: [String] = ["와우! 판타스틱하네요~^^", "멋지구베이징", "우와~ 무슨 툴로 작업하셨나요?"]
    var nickNameList: [String] = ["와우님", "베이징님", "미니언즈님"]
    var profileList: [UIImage] = [UIImage(named: "profileBig")!, UIImage(named: "profileBig")!, UIImage(named: "profileBig")!]
    
    var workIdx: Int?
    var workImg: UIImage?
    var headTitle: String?
    var subTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarTitle()
        initGestureRecognizer()
        setUI()
        detailCV.dataSource = self
        replyTable.dataSource = self
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDetailData()
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func setNavigationBarTitle() {
        let image = UIImage(named: "logoImg")
        navigationItem.titleView = UIImageView(image: image)
    }
    
    func setUI() {
        let yourColor = UIColor(red: 195.0/255, green: 195.0/255, blue: 195.0/255, alpha: 1.0)
        viewlikeText.layer.borderWidth = 1.0
        viewlikeText.layer.borderColor = yourColor.cgColor
        viewlikeText.layer.cornerRadius = 20
        viewlikeText.layer.masksToBounds = true
        
        replyBtn.layer.cornerRadius = 16
        replyBtn.layer.masksToBounds = true
    }
    
    // 댓글쓰기 창 보이고 싶다.
    func showMenuView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            self.replyView.transform = CGAffineTransform(translationX: 0, y: 100)
        })
        
        self.view.layoutIfNeeded()
    }
    
    // 댓글쓰기 창 가리고 싶다.
    func hideMenuView() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.replyView.transform = .identity
        })
        
        self.view.layoutIfNeeded()
    }
    
    @IBAction func replyBtn(_ sender: UIButton) {
        replyList.append("\(replyText.text!)")
        nickNameList.append("이음팀")
        profileList.append(UIImage(named: "profileBig")!)
        replyTable.reloadData()
        
        replyText.text = ""
    }
    
    @IBAction func heartBtn(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        sender.isSelected = !sender.isSelected
        
        // 만약 선택되어 있으면
        if sender.isSelected {
            appDelegate.like += 1
        }
        else {
            appDelegate.like -= 1
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func starBtn(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            appDelegate.scrap += 1
        }
        else {
            appDelegate.scrap -= 1
        }
    }
    
}

// 스크롤시 댓글창 뷰 올리고 내리기
extension SubViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yVelocity = self.scrollView.panGestureRecognizer .velocity(in: scrollView).y
        
        if yVelocity > 0 {
            hideMenuView()
            
        } else if yVelocity < 0 {
            showMenuView()
        }
    }
}

extension SubViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCell
        
        cell.workIdx = self.workIdx
        print("cell.workIdx", cell.workIdx) // 21
        cell.detailImg.image = appDelegate.detailList[self.workIdx!].posterImg
        self.detailLabel.text = appDelegate.detailList[self.workIdx!].explanation
        return cell
    }
}

extension SubViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nickNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = replyTable.dequeueReusableCell(withIdentifier: "ReplyCell", for: indexPath) as! ReplyTVC
        
        // Configure the cell...
        cell.nickname!.text = self.nickNameList[indexPath.row]
        cell.reply!.text = self.replyList[indexPath.row]
        cell.profile!.image = self.profileList[indexPath.row]
        
        return cell
    }
}

extension SubViewController {
    
    func setDetailData() {
        self.workTitle.text = headTitle
        self.workSubTitle.text = subTitle
        self.workImgView.image = workImg
    }
}


extension SubViewController: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.replyText.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: replyText))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.view.frame.origin.y = -keyboardHeight
        })
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.view.frame.origin.y = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
