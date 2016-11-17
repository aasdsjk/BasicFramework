//
//  BasicWkWebViewController.swift
//  ttkhj
//
//  Created by ning on 16/10/27.
//  Copyright © 2016年 songjk. All rights reserved.
//

import UIKit
import WebKit
@objc class BasicWkWebViewController: BasicViewController,WKNavigationDelegate {

    var webView: WKWebView?
    
    init(url: String!) {
        
        super.init(nibName: nil, bundle: nil)
        
        let requsetUrl = URL.init(string: url)
        let request = URLRequest.init(url: requsetUrl!)
        let wkWeb = WKWebView.init(frame: self.view.bounds)
        self.view.addSubview(wkWeb)
        wkWeb.load(request)
        wkWeb.navigationDelegate = self;
        self.webView = wkWeb
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let requeststr = navigationAction.request.mainDocumentURL?.relativeString;
        if requeststr?.range(of: "#") != nil{
            let data = self.requesParmeter(request: requeststr!)
            if let doStr = data["do"]{
                let selector = NSSelectorFromString((doStr as! String).appending(":"))
                if self.responds(to: selector) {
                    self.perform(selector, with: data)
                    decisionHandler(WKNavigationActionPolicy.cancel)
                }
            }
            
        }
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    func requesParmeter(request: String) ->NSDictionary{
        let array = request.components(separatedBy: "#")
        let requestStr = array.last
        return self.getrequestjson(requeststr: requestStr!)
    }
    func getrequestjson(requeststr: String) ->NSDictionary {
        let requestString = requeststr.removingPercentEncoding
        let strData = requestString?.data(using: String.Encoding.utf8)
        do {
            let weatherDic = try JSONSerialization.jsonObject(with: strData!, options: .mutableLeaves)
            return weatherDic as! NSDictionary;
        } catch { }
        return NSDictionary()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
    //    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    //        super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
    //        if keyPath == "title" {
    //            self.title = change?[NSKeyValueChangeKey.newKey] as? String
    //        }
    //    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        self.webView?.removeObserver(self, forKeyPath: "title")
    }
}
//js方法
extension BasicWkWebViewController{
    
    
    
}
