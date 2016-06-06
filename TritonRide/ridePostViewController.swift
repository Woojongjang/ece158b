//
//  ridePost.swift
//  TritonRide
//
//  Created by Ann Chih on 6/5/16.
//  Copyright © 2016 UCSD. All rights reserved.
//

import UIKit
import Firebase
class ridePostViewController: UITableViewController {
    
    
    let ref = FIRDatabase.database().reference()
    //var ridePosts:[ridePost] = postData
    
    @IBOutlet weak var spotField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var posts: ridePost?
    var ridePosts:[ridePost] = postData
    //let ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerChanged()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("error no good")
    }
    
    
    @IBAction func cancelPostView(segue:UIStoryboardSegue) {
    }
    
    @IBAction func savePostDetail(sender:UIButton) {
        let spots = spotField.text
        let time = datePicker.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.stringFromDate(time)
        

        //self.ref.child("time").setValue(["time": time])
        self.ref.child("ridePost").child("time").setValue(dateString)
        self.ref.child("ridePost").child("spotAvail").setValue(spots)
        
        

    }

    func datePickerChanged () {
        timeLabel.text = NSDateFormatter.localizedStringFromDate(datePicker.date, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            toggleDatepicker()
        }
    }
    var datePickerHidden = false
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if datePickerHidden && indexPath.section == 0 && indexPath.row == 1 {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    func toggleDatepicker() {
        datePickerHidden = !datePickerHidden
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    @IBAction func datePickerValue(sender: UIDatePicker) {
        datePickerChanged()
    }



        
}
