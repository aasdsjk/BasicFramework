//
//  BannerAndTips.swift
//  SomeUI
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

import UIKit



let screenW : CGFloat = UIScreen.main.bounds.width
let screenH : CGFloat = UIScreen.main.bounds.height
let bannerHeight : CGFloat = screenW*434/750

class BannerAndTips: UIView ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var bannerView : UICollectionView!
    var pageControl : UIPageControl!
    var timer : Timer!
    var  button1 : UIButton!
    var  button2 : UIButton!
    var  button3 : UIButton!
    
   
    
    public var picModel : NSArray!{
        didSet {
            bannerView.reloadData()
            addTimer()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        picModel = NSArray.init()
        setupBanner()
    }
    private func setupBanner(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize.init(width: screenW, height: bannerHeight)
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        bannerView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: screenW, height: bannerHeight), collectionViewLayout: layout)
        bannerView.bounces = false
        bannerView.backgroundColor = UIColor.white
        bannerView.isPagingEnabled = true
        bannerView.delegate = self
        bannerView.dataSource = self
        bannerView.showsHorizontalScrollIndicator = false
        bannerView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        self.addSubview(bannerView)
        
        button1 = UIButton.init(type: .custom)
        
        button2 = UIButton.init(type: .custom)
        button3 = UIButton.init(type: .custom)
        
        button1.tag = 110
        button2.tag = 111
        button3.tag = 112
        button1.addTarget(self, action: #selector(threeButtonOrBannerClick(button:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(threeButtonOrBannerClick(button:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(threeButtonOrBannerClick(button:)), for: .touchUpInside)
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        layoutDownView()
        
        pageControl = UIPageControl()
        pageControl.frame = CGRect.init(x: 0, y: bannerView.height-20, width: 50, height: 10)
        pageControl.centerX = bannerView.centerX
        pageControl.currentPageIndicatorTintColor = navColor
        pageControl.numberOfPages = 4
//        pageControl.isEnabled = false
        pageControl.pageIndicatorTintColor = UIColor.white
        self.addSubview(pageControl)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layoutDownView()  {
        let width = (screenW-40)/3.0
        button1.frame = CGRect.init(x: 10, y: bannerView.height+10, width: (screenW-40)/3, height: ((screenW-40)/3)*90/220 )
        button2.frame = CGRect.init(x: button1.x+button1.width+10, y: button1.y, width: width, height: button1.height)
        button3.frame = CGRect.init(x: button2.x+button2.width+10, y: button2.y, width: width, height: button1.height)
        
        
    }
    
    open func addTimer()  {
        if timer==nil {
            timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(changePageControl), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        }
        
    }
    open func removeTimer() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x;
        let index = (offsetX + screenW * 0.5)/screenW;
        
        if (self.picModel.count==4) {
            self.pageControl.currentPage = Int(index) % 4;
        }
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    @objc func changePageControl(){
        
        let indexPath = bannerView.indexPathsForVisibleItems.last//NSIndexPath.init(forRow: 0, inSection: 0)
        if indexPath == nil {
            return
        }
        print("indexPath=\(indexPath)")
        bannerView.scrollToItem(at: IndexPath.init(row: (indexPath! as NSIndexPath).item, section: 100/2), at: .left, animated: false)
        var nextRow = (indexPath! as NSIndexPath).item + 1
        var nextSection = 100/2
        if nextRow == picModel.count {//picModel.count
            nextRow = 0
            nextSection = nextSection + 1
        }
        let index = IndexPath.init(row: nextRow, section: nextSection)
        print("index=\(index)")
        bannerView.scrollToItem(at: index, at: .left, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picModel == nil ? 0 : picModel.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell
//        if cell == nil {
//            cell = BannerCollectionViewCell.init(frame: CGRect.init(x: 0, y: 0, width: screenW, height: bannerHeight))
//        }
//        if picModel.count > 0 {
//            var model = BannerModel.init()
//            model = picModel[indexPath.item] as! BannerModel
//            cell!.imageStr = model.picture
//        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //点击轮播图
        let btn = UIButton.init()
        btn.tag = indexPath.row + 120
        threeButtonOrBannerClick(button: btn)
    }
    
    
}
extension BannerAndTips{
    func threeButtonOrBannerClick(button:UIButton)  {
//        if self.tipThreeButton != nil {
//            self.tipThreeButton(button.tag-110)
//        }
    }
    
}
