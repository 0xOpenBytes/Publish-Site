import Foundation
import Publish
import Plot
import HighlightJSPublishPlugin
import CNAMEPublishPlugin

// This type acts as the configuration for your website.
struct OpenBytesSite: Website {
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
    var url = URL(string: "https://openbytes.dev")!
    var name = "0xOpenBytes"
    var description = "Independent developers looking to help others learn and overcome the many obstacles software development has to offer."
    var language: Language { .english }
    var imagePath: Path? { "https://avatars.githubusercontent.com/u/92551192?s=200&v=4" }
}

// This will generate your website using the built-in Foundation theme:
try OpenBytesSite()
    .publish(
        using: [
            .installPlugin(.highlightJS()),
            .installPlugin(.generateCNAME(with: "openbytes.dev", "www.openbytes.dev")),
            .addMarkdownFiles(),
            .copyResources(),
            .generateHTML(withTheme: .openBytes),
            .generateRSSFeed(including: [.posts]),
            .generateSiteMap(),
            .deploy(using: .gitHub("0xOpenBytes/0xopenbytes.github.io"))
        ]
    )

