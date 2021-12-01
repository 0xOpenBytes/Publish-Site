import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct PublishSite: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
        case projects
        case github
    }
    
    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }
    
    // Update these properties to configure your website:
    var url = URL(string: "https://0xopenbytes.github.io/")!
    var name = "0xOpenBytes"
    var description = "Independent developers looking to help others learn and overcome the many obstacles software development has to offer."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try PublishSite()
    .publish(
        using: [
            .installPlugin(.splash(withClassPrefix: "")),
            .addMarkdownFiles(),
            .copyResources(),
            .generateHTML(withTheme: .foundation),
            .generateRSSFeed(including: [.posts]),
            .generateSiteMap(),
            .deploy(using: .gitHub("0xOpenBytes/0xopenbytes.github.io"))
        ]
    )

