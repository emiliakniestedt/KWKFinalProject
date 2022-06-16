
import UIKit

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    }

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var selectedDate = Date()
    var totalSquares = [Date]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    func setCellsView(){
        let width = (collectionView.frame.size.width - 2)/8
        let height = (collectionView.frame.size.height - 2)/8
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize (width: width, height: height)
    }
    func setMonthView(){
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
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
        
    }
    

    @IBAction func previousWeek(_ sender: Any) {
        selectedDate = CalenderHelper().addDays(date: selectedDate, days: -7)
        setMonthView()
    }
    
    @IBAction func nextWeek(_ sender: Any) {
        selectedDate = CalenderHelper().addDays(date: selectedDate, days: 7)
        setMonthView()
    }

    override open var shouldAutorotate: Bool{
        return false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
