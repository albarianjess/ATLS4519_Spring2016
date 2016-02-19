//
//  CollectionViewController.swift
//  Lab5
//
//  Created by Jessie Albarian on 2/16/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import UIKit
import JSONJoy



struct Address : JSONJoy {
    var objID: Int
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
    
    init(_ decoder: JSONDecoder) throws {
        objID = try decoder["id"].getInt()
        streetAddress = try decoder["street_address"].getString()
        city = try decoder["city"].getString()
        state = try decoder["state"].getString()
        postalCode = try decoder["postal_code"].getString()
    }
}

struct User : JSONJoy {
    var objID: Int
    var firstName: String
    var lastName: String
    var age: Int
    var address: Address
    
    init(_ decoder: JSONDecoder) throws {
        objID = try decoder["id"].getInt()
        firstName = try decoder["first_name"].getString()
        lastName = try decoder["last_name"].getString()
        age = try decoder["age"].getInt()
        address = try Address(decoder["address"])
    }
}


class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NSURLConnectionDelegate {

    var myImages = [String]()
    let reuseIdentifier = "Cell"
    

    func getData(){
        var user = try User(JSONDecoder(data))
        print("city is: \(user.address.city)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        self.collectionView?.setCollectionViewLayout(layout, animated: true)
    
        
        // Loop through images; store in array
        for i in 1...5{
            myImages.append("kitten" + String(i+1))
        }

        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let image = UIImage(named: myImages[indexPath.row])
//        let size:CGSize = CGSize(width: (image?.size.width)!/8, height: (image?.size.height)!/40)
//        let rect = CGRectMake(0, 0, size.width, size.height)
//        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
//        image?.drawInRect(rect)
//        let image2 = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return (image2?.size)!
//    }
    
    
    
    // CREATE HEADER
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath:
        NSIndexPath) -> UICollectionReusableView {
            var header: CollectionSupplementaryView?
            if kind == UICollectionElementKindSectionHeader{
                header = collectionView.dequeueReusableSupplementaryViewOfKind(kind,withReuseIdentifier: "Header", forIndexPath: indexPath) as?CollectionSupplementaryView
                header?.headerLabel.text = "Kitten Love <3"
            }
            return header!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        let cell =
        collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier,
            forIndexPath: indexPath) as! CollectionViewCell
        
        // Configure the cell
        let image = UIImage(named: myImages[indexPath.row])
        cell.mainImage.image = image
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
