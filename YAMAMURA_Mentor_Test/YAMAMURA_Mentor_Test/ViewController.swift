import UIKit




class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ボタンが押された時にshowModalメソッドを実行
    @IBAction func myButton(sender: UIButton) {
        showModal()
    }
    
    //ModalViewを表示する
    func showModal() {
        let modalView = ModalView(frame: self.view.bounds)
        self.view.addSubview(modalView)
    }
    
    func addText(){
        self.view.text = self.textView.text
    }
}