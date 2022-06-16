
import UIKit

var selectedDate = Date()


class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalenderCell
        let date=totalSquares[indexPath.item]
        cell.dayOfMonth.text = String(CalenderHelper().daysOfMonth(date: date))
        if (date==selectedDate)
        {
            cell.backgroundColor = UIColor.systemGreen
        }
        else{
            cell.backgroundColor = UIColor.white

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        tableView.reloadData()

    }

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var totalSquares = [Date]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setWeekView()
    }
    func setCellsView(){
        let width = (collectionView.frame.size.width - 2)/8
        let height = (collectionView.frame.size.height - 2)/8
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize (width: width, height: height)
    }
    func setWeekView(){
        totalSquares.removeAll()
        var current=CalenderHelper().sundayForDate(date: selectedDate)
        let nextSunday=CalenderHelper().addDays(date: current, days: 7)
        while (current<nextSunday)
        {
            totalSquares.append(current)
            current=CalenderHelper().addDays(date: current, days: 1)
        }
        monthLabel.text=CalenderHelper().monthString(date: selectedDate) + " " + CalenderHelper().yearString(date: selectedDate)
        collectionView.reloadData()
        tableView.reloadData()

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
        
    }
    

    @IBAction func previousWeek(_ sender: Any) {
        selectedDate = CalenderHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    @IBAction func nextWeek(_ sender: Any) {
        selectedDate = CalenderHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }

    override open var shouldAutorotate: Bool{
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        cell.eventLabel.text = event.name + " " + CalenderHelper().timeString(date: event.date)
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

}
