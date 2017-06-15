//
//  CandyStickerBrowserViewController.swift
//  Stickerlicious
//
//  Created by Norman Lopez on 6/14/17.
//  Copyright © 2017 Norman Lopez. All rights reserved.
//

import Messages

let stickerNames = ["CandyCane", "Caramel", "ChocolateBar",
                    "ChocolateChip", "DarkChocolate", "GummiBear",
                    "JawBreaker", "Lollipop", "SourCandy"]

class CandyStickerBrowserViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStickers()
        stickerBrowserView.backgroundColor = #colorLiteral(
            red:  0.9490196078, green: 0.7568627451,
            blue: 0.8196078431, alpha: 1)
    }
    
    
}

extension CandyStickerBrowserViewController {
    func loadStickers(_ chocoholic: Bool = false) {
        stickers = stickerNames.filter( { name in
            return chocoholic ? name.contains("Chocolate") : true
        }).map({ name in
            let url = Bundle.main.url(forResource: name,
                                      withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url,
                                  localizedDescription: name)
        })
    }
}

extension CandyStickerBrowserViewController: Chocoholicable {
    func setChocoholic(_ chocoholic: Bool) {
        loadStickers(chocoholic)
        stickerBrowserView.reloadData()
    }
}

//MARK: MSStickerBrowserViewDataSource
extension CandyStickerBrowserViewController {
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView,
                                     stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
