//
//  ReuseWebView.swift
//  RReader
//
//  Created by Frank Michael on 6/5/14.
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

import UIKit

class ReuseWebView: UIViewController, UIWebViewDelegate {
    
    var url: NSURL?
    var webTitle: NSString?
    
    var mainWebView: UIWebView?
    var actionsBar = UIToolbar()
    var webBack: UIBarButtonItem?
    var webForward: UIBarButtonItem?
    var webRefresh: UIBarButtonItem?
    var webStop: UIBarButtonItem?
    
    init(url webURL:NSURL){
        super.init(nibName: nil, bundle: nil)
        url = webURL
        mainWebView = UIWebView()
    }
    
    func setupClass(){
        self.view.backgroundColor = UIColor.whiteColor()
        mainWebView!.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        mainWebView!.delegate = self
        mainWebView!.backgroundColor = UIColor.whiteColor()
        mainWebView!.scalesPageToFit = true
        
        var contentInsets: UIEdgeInsets
        if self.parentViewController is UINavigationController {
            contentInsets = UIEdgeInsetsMake(0, 0, 44, 0)
        }else{
            contentInsets = UIEdgeInsetsMake(20, 0, 44, 0)
        }
        mainWebView!.scrollView.contentInset = contentInsets
        mainWebView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(mainWebView!)
        
        // Autolayout code
        let horizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[webview]-(0)-|", options: NSLayoutFormatOptions.AlignmentMask, metrics: nil, views: ["webview": mainWebView!])
        let vertical = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[webview]-(0)-|", options: NSLayoutFormatOptions.AlignmentMask, metrics: nil, views: ["webview": mainWebView!])
        self.view.addConstraints(horizontal)
        self.view.addConstraints(vertical)
        
        // Toolbar setup
        actionsBar.frame = CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)
        actionsBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Toolbar items setup
        webBack = UIBarButtonItem(image: UIImage(named: "765-arrow-left"), style: .Plain, target: mainWebView, action: "goBack")
        webBack!.enabled = false
        webForward = UIBarButtonItem(image: UIImage(named: "766-arrow-right"), style: .Plain, target: mainWebView, action: "goForward")
        webForward!.enabled = false
        webRefresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: mainWebView, action: "reload")
        webStop = UIBarButtonItem(barButtonSystemItem: .Stop, target: mainWebView, action: "stop")
        let action = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "showActivity")
        let flexspace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        let allItems = [webBack!,flexspace,webForward!,flexspace,webRefresh!,flexspace,webStop!,flexspace,action]
        actionsBar.setItems(allItems, animated: true)
        
        self.view.addSubview(actionsBar)
        
        // Toolbar Autolayout
        let toolbarHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[toolbar]-(0)-|", options: .AlignmentMask, metrics: nil, views: ["toolbar": actionsBar])
        let toolbarVertical = NSLayoutConstraint.constraintsWithVisualFormat("V:[toolbar]-(0)-|", options: .AlignmentMask, metrics: nil, views: ["toolbar": actionsBar])
        self.view.addConstraints(toolbarHorizontal)
        self.view.addConstraints(toolbarVertical)
        
        if self.parentViewController is UINavigationController {
            let dismissView = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "dismissWeb")
            self.navigationItem.leftBarButtonItem = dismissView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupClass()
        // Do any additional setup after loading the view.
        mainWebView!.loadRequest(NSURLRequest(URL: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissWeb() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: WebView Delegate
    func webViewDidStartLoad(webView: UIWebView!) {
        webStop!.enabled = true
        if webView.canGoBack{
            webBack!.enabled = true
        }
        if webView.canGoForward{
            webForward!.enabled = true
        }
    }
    func webViewDidFinishLoad(webView: UIWebView!) {
        webStop!.enabled = false
        if webView.canGoBack{
            webBack!.enabled = true
        }
        if webView.canGoForward{
            webForward!.enabled = true
        }
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
