//
//  ViewController.swift
//  Card
//
//  Created by 陳怡萱 on 2022/9/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //預設第一頁
        SetViewItem(0)
    }
    let Images = ["TaipeiCity", "NewTaipeiCity", "keelung"]
    let CityLabels = ["台北市","新北市","基隆市"]
    let Candidates = ["6號：蔣萬安（國民黨） \n8號：黃珊珊（無黨籍） \n12號：陳時中（民進黨）","1號：林佳龍（民進黨） \n2號：侯友宜（國民黨）","1號謝國樑（國民黨）\n2號陳薇仲（時代力量）\n3號蔡適應（民進黨）\n4號曾國民（無黨籍）\n5號黃希賢（無黨籍）"]
    
    //初始化
    var index = 0
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var CandidateText: UITextView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var ISegmentedControl: UISegmentedControl!
    
    //依照傳入的index修改畫面資料
    public func SetViewItem(_ setIndex: Int){
        let name = Images[setIndex]
        ImageView.image = UIImage(named: Images[setIndex])
        print(setIndex, name)
        //城市label
        CityLabel.text = CityLabels[setIndex]
        //候選人text
        CandidateText.text = Candidates[setIndex]
        //切頁點點
        PageControl.currentPage = setIndex
        //切頁標籤
        ISegmentedControl.selectedSegmentIndex = setIndex
    }
    
    //向右
    @IBAction func RightButton(_ sender: Any) {
        //使影像往後跑，將index+1除以照片張數的餘數存入index
        index = (index + 1) % Images.count
        SetViewItem(index)
    }
    //向左
    @IBAction func LeftButton(_ sender: Any) {
        //使影像往前跑，算式使index不會少於0
        index = (Images.count + index - 1) % Images.count
        SetViewItem(index)
    }
    //切頁點點
    @IBAction func PageControlAction(_ sender: UIPageControl) {
        index = sender.currentPage
        SetViewItem(index)
    }
    //切頁標籤
    @IBAction func SegmentedAction(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        SetViewItem(index)
    }
    
}


