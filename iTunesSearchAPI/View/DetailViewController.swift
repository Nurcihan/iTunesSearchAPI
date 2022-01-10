//
//  DetailViewController.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 8.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var detailViewModel : DetailViewModel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var wrapperTypeLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var primaryGenreLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Content Detail"
        view.backgroundColor = GlobalConstants.COLOR_LIGHT_GRAY
        contentView.backgroundColor = GlobalConstants.COLOR_LIGHT_GRAY
        setLabelsUI()
        setImageAndLabels()
        
    }
    //MARK Labels UI
    func setLabelsUI(){
        wrapperTypeLabel.textAlignment = .left
        wrapperTypeLabel.numberOfLines = 0
        wrapperTypeLabel.lineBreakMode = .byWordWrapping
        wrapperTypeLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        wrapperTypeLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        
        trackNameLabel.textAlignment = .left
        trackNameLabel.numberOfLines = 0
        trackNameLabel.lineBreakMode = .byWordWrapping
        trackNameLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        trackNameLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        
        countryLabel.textAlignment = .left
        countryLabel.numberOfLines = 0
        countryLabel.lineBreakMode = .byWordWrapping
        countryLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        countryLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        
        kindLabel.textAlignment = .left
        kindLabel.numberOfLines = 0
        kindLabel.lineBreakMode = .byWordWrapping
        kindLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        kindLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        
        primaryGenreLabel.textAlignment = .left
        primaryGenreLabel.numberOfLines = 0
        primaryGenreLabel.lineBreakMode = .byWordWrapping
        primaryGenreLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        primaryGenreLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        
        firstLabel.textAlignment = .left
        firstLabel.numberOfLines = 0
        firstLabel.lineBreakMode = .byWordWrapping
        firstLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        firstLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        
        secondLabel.textAlignment = .left
        secondLabel.numberOfLines = 0
        secondLabel.lineBreakMode = .byWordWrapping
        secondLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        secondLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        
        thirdLabel.textAlignment = .left
        thirdLabel.numberOfLines = 0
        thirdLabel.lineBreakMode = .byWordWrapping
        thirdLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        thirdLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        
        fourthLabel.textAlignment = .left
        fourthLabel.numberOfLines = 0
        fourthLabel.lineBreakMode = .byWordWrapping
        fourthLabel.textColor = GlobalConstants.COLOR_LIGHT_BLACK
        fourthLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
    }
    
    func convertDateFormat(inputDate: String) -> String{
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate)!
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    //MARK Set Values
    func setImageAndLabels(){
        
        imageView.sd_setImage(with: URL(string: detailViewModel.artworkUrl100), placeholderImage: UIImage(named: "placeHolder.png"))
        
        wrapperTypeLabel.text = "Wrapper Type : \(detailViewModel.wrapperType)"
        trackNameLabel.text = detailViewModel.trackName
        
        let kindBoldText = "Kind: "
        let kindAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let kindAttributedString = NSMutableAttributedString(string:kindBoldText, attributes:kindAttrs)
        let kindNormalString = NSMutableAttributedString(string:detailViewModel.kind)
        kindAttributedString.append(kindNormalString)
        kindLabel.attributedText = kindAttributedString
        
        let primaryBoldText = "Primary Genre: "
        let primaryAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let primaryAttributedString = NSMutableAttributedString(string:primaryBoldText, attributes:primaryAttrs)
        let primaryNormalString = NSMutableAttributedString(string:detailViewModel.primaryGenreName)
        primaryAttributedString.append(primaryNormalString)
        primaryGenreLabel.attributedText = primaryAttributedString
        
        let countryBoldText = "Country: "
        let countryAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let countryAttributedString = NSMutableAttributedString(string:countryBoldText, attributes:countryAttrs)
        let countryNormalString = NSMutableAttributedString(string:detailViewModel.country)
        countryAttributedString.append(countryNormalString)
        countryLabel.attributedText = countryAttributedString
        
        switch detailViewModel.contentType{
        case .none:
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = ""
            fourthLabel.text = ""
        case .movie:
            let collectionBoldText = "Collection Price: "
            let collectionAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let collectionAttributedString = NSMutableAttributedString(string:collectionBoldText, attributes:collectionAttrs)
            let collectionNormalString = NSMutableAttributedString(string:"\(detailViewModel.collectionPrice) \(detailViewModel.currency)")
            collectionAttributedString.append(collectionNormalString)
            firstLabel.attributedText = collectionAttributedString
            
            let releaseBoldText = "Release Date : "
            let releaseAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let releaseAttributedString = NSMutableAttributedString(string:releaseBoldText, attributes:releaseAttrs)
            let releaseNormalString = NSMutableAttributedString(string:convertDateFormat(inputDate: detailViewModel.releaseDate))
            releaseAttributedString.append(releaseNormalString)
            secondLabel.attributedText = releaseAttributedString
            
            thirdLabel.text = detailViewModel.shortDescription
            fourthLabel.text = detailViewModel.longDescription
            
        case .music:
            let artistBoldText = "Artist: "
            let artistAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let artistAttributedString = NSMutableAttributedString(string:artistBoldText, attributes:artistAttrs)
            let artistNormalString = NSMutableAttributedString(string:detailViewModel.artistName)
            artistAttributedString.append(artistNormalString)
            firstLabel.attributedText = artistAttributedString
            
            let collBoldText = "Collection Name: "
            let collAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let collAttributedString = NSMutableAttributedString(string:collBoldText, attributes:collAttrs)
            let collNormalString = NSMutableAttributedString(string:detailViewModel.collectionName)
            collAttributedString.append(collNormalString)
            secondLabel.attributedText = collAttributedString
            
            let releaseBoldText = "Release Date: "
            let releaseAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let releaseAttributedString = NSMutableAttributedString(string:releaseBoldText, attributes:releaseAttrs)
            let releaseNormalString = NSMutableAttributedString(string:convertDateFormat(inputDate: detailViewModel.releaseDate))
            releaseAttributedString.append(releaseNormalString)
            thirdLabel.attributedText = releaseAttributedString
            
            let priceBoldText = "Track Price: "
            let priceAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let priceAttributedString = NSMutableAttributedString(string:priceBoldText, attributes:priceAttrs)
            let priceNormalString = NSMutableAttributedString(string:"\(detailViewModel.trackPrice) \(detailViewModel.currency)")
            priceAttributedString.append(priceNormalString)
            fourthLabel.attributedText = priceAttributedString
            
        case .book:
            let artistBoldText = "Artist: "
            let artistAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let artistAttributedString = NSMutableAttributedString(string:artistBoldText, attributes:artistAttrs)
            let artistNormalString = NSMutableAttributedString(string:detailViewModel.artistName)
            artistAttributedString.append(artistNormalString)
            firstLabel.attributedText = artistAttributedString
            
            let collBoldText = "Collection Name: "
            let collAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let collAttributedString = NSMutableAttributedString(string:collBoldText, attributes:collAttrs)
            let collNormalString = NSMutableAttributedString(string:detailViewModel.collectionName)
            collAttributedString.append(collNormalString)
            secondLabel.attributedText = collAttributedString
            
            let releaseBoldText = "Release Date: "
            let releaseAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let releaseAttributedString = NSMutableAttributedString(string:releaseBoldText, attributes:releaseAttrs)
            let releaseNormalString = NSMutableAttributedString(string:convertDateFormat(inputDate: detailViewModel.releaseDate))
            releaseAttributedString.append(releaseNormalString)
            thirdLabel.attributedText = releaseAttributedString
            
            let priceBoldText = "Collection Price: "
            let priceAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let priceAttributedString = NSMutableAttributedString(string:priceBoldText, attributes:priceAttrs)
            let priceNormalString = NSMutableAttributedString(string:"\(detailViewModel.collectionPrice) \(detailViewModel.currency)")
            priceAttributedString.append(priceNormalString)
            fourthLabel.attributedText = priceAttributedString
            
        case .tvShow:
            let artistBoldText = "Artist: "
            let artistAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let artistAttributedString = NSMutableAttributedString(string:artistBoldText, attributes:artistAttrs)
            let artistNormalString = NSMutableAttributedString(string:detailViewModel.artistName)
            artistAttributedString.append(artistNormalString)
            firstLabel.attributedText = artistAttributedString
            
            let rateBoldText = "Rating Index: "
            let rateAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let rateAttributedString = NSMutableAttributedString(string:rateBoldText, attributes:rateAttrs)
            let rateNormalString = NSMutableAttributedString(string:detailViewModel.collectionName)
            rateAttributedString.append(rateNormalString)
            secondLabel.attributedText = rateAttributedString
            
            let showTermBoldText = "Show Term : "
            let showTermAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let showTermAttributedString = NSMutableAttributedString(string:showTermBoldText, attributes:showTermAttrs)
            let showTermNormalString = NSMutableAttributedString(string:detailViewModel.showTerm)
            showTermAttributedString.append(showTermNormalString)
            thirdLabel.attributedText = showTermAttributedString
            
            let priceBoldText = "Collection Price: "
            let priceAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let priceAttributedString = NSMutableAttributedString(string:priceBoldText, attributes:priceAttrs)
            let priceNormalString = NSMutableAttributedString(string:"\(detailViewModel.collectionPrice) \(detailViewModel.currency)")
            priceAttributedString.append(priceNormalString)
            fourthLabel.attributedText = priceAttributedString
            
        case .software:
            let artistBoldText = "Artist: "
            let artistAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let artistAttributedString = NSMutableAttributedString(string:artistBoldText, attributes:artistAttrs)
            let artistNormalString = NSMutableAttributedString(string:detailViewModel.artistName)
            artistAttributedString.append(artistNormalString)
            firstLabel.attributedText = artistAttributedString
            
            let desBoldText = "Description: "
            let desAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let desAttributedString = NSMutableAttributedString(string:desBoldText, attributes:desAttrs)
            let desNormalString = NSMutableAttributedString(string:detailViewModel.description)
            desAttributedString.append(desNormalString)
            secondLabel.attributedText = desAttributedString
            
            let noteBoldText = "Release Notes: "
            let noteAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let noteAttributedString = NSMutableAttributedString(string:noteBoldText, attributes:noteAttrs)
            let noteNormalString = NSMutableAttributedString(string:detailViewModel.releaseNotes)
            noteAttributedString.append(noteNormalString)
            thirdLabel.attributedText = noteAttributedString
            
            let priceBoldText = "Collection Price: "
            let priceAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            let priceAttributedString = NSMutableAttributedString(string:priceBoldText, attributes:priceAttrs)
            let priceNormalString = NSMutableAttributedString(string:"\(detailViewModel.collectionPrice) \(detailViewModel.currency)")
            priceAttributedString.append(priceNormalString)
            fourthLabel.attributedText = priceAttributedString
            
            
        }
        
        
    }
    
    
}

