//
//  DetailViewModel.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 7.01.2022.
//

import Foundation

enum ContentType {
    case none
    case movie
    case music
    case book
    case tvShow
    case software

}

struct DetailViewModel{
    // MARK:  Properties

    let content :ContentModel

    var contentType:ContentType{
        if self.content.kind == "feature-movie" || self.content.kind == "shortFilm"{
            return .movie
        }
        else if self.content.kind == "album" || self.content.kind == "podcast" || self.content.kind == "musicVideo" || self.content.kind == "song"{
            return .music
        }
        else if self.content.kind == "audioBook" || self.content.kind == "eBook" || self.content.kind == "book"{
            return .book
        }
        else if self.content.kind == "tvShow" || self.content.kind == "tv-episode" {
            return .tvShow
        }
        else if self.content.kind == "software" {
            return .software
        }
        return .none
    }
    
    var kind:String {
      let kind = self.content.kind ?? "audiobook"
      switch kind {
      case "album": return "Album"
      case "audiobook": return "Audio Book"
      case "book": return "Book"
      case "ebook": return "E-Book"
      case "feature-movie": return "Movie"
      case "music-video": return "Music Video"
      case "podcast": return "Podcast"
      case "software": return "App"
      case "song": return "Song"
      case "tv-episode": return "TV Episode"
      default: break
      }
      return "Unknown"
    }
    
    var wrapperType :String {
        return self.content.wrapperType ?? ""
    }
  
    var collectionName :String {
        return self.content.collectionName ?? ""
    }
    var artworkUrl30 :String {
        return self.content.artworkUrl30 ?? ""
    }
    var artworkUrl60 :String {
        return self.content.artworkUrl60 ?? ""
    }
    var artworkUrl100 :String {
        return self.content.artworkUrl100 ?? ""
    }
    var explicitness :String {
        return self.content.explicitness ?? ""
    }
    var trackName :String {
        return self.content.trackName ?? ""
    }
    var artistName :String {
        return self.content.artistName ?? ""
    }
    var previewUrl :String {
        return self.content.previewUrl ?? ""
    }
    var collectionPrice :Double {
        return self.content.collectionPrice ?? 0.0
    }
    var trackPrice :Double {
        return self.content.trackPrice ?? 0.0
    }
    var releaseDate :String {
        return self.content.releaseDate ?? ""
    }
    var country :String {
        return self.content.country ?? ""
    }
    var currency :String {
        return self.content.currency ?? ""
    }
    var longDescription :String {
        return self.content.longDescription ?? ""
    }
    var shortDescription :String {
        return self.content.shortDescription ?? ""
    }
    var primaryGenreName :String {
        return self.content.primaryGenreName ?? ""
    }
    var ratingIndex :String {
        return self.content.ratingIndex ?? ""
    }
    var showTerm :String {
        return self.content.showTerm ?? ""
    }
    var description :String {
        return self.content.description ?? ""
    }
    var releaseNotes :String {
        return self.content.releaseNotes ?? ""
    }
   
    

}
