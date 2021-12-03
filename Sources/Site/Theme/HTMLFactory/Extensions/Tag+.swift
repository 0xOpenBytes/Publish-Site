import Publish

extension Tag {
    enum ColoredTag: String {
        case screendata, severdriven
        case swift, swiftlet, spm
        case ios, swiftui
        case kotlin
        case android
        
        var cssID: String {
            switch self {
            case .screendata, .severdriven:
                return "tag-sd"
            case .swift, .swiftlet, .spm:
                return "tag-swift"
            case .ios, .swiftui:
                return "tag-ios"
            case .kotlin:
                return "tag-kotlin"
            case .android:
                return "tag-android"
            }
        }
    }
    
    var cssID: String? {
        ColoredTag(rawValue: string.lowercased())?.cssID
    }
}

extension Collection where Iterator.Element == Tag {
    func ordered() -> [Tag] {
        sorted { lhs, rhs in
            guard
                let lhsCSSID = lhs.cssID,
                let rhsCSSID = rhs.cssID
            else {
                if lhs.cssID != nil {
                    return true
                } else if rhs.cssID != nil {
                    return false
                }
                
                return lhs.string < rhs.string
            }
            
            if lhsCSSID == rhsCSSID {
                return lhs.string < rhs.string
            }
            
            return lhsCSSID < rhsCSSID
        }
    }
}
