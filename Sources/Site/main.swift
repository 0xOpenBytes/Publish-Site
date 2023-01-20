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
    var description = """
                      OpenBytes is a small group of passionate open source developers who come together to collaborate on projects and share their knowledge. Our core members are experienced in mobile development (iOS and Android), web development, and full-stack development and act as mentors for others in the group. They help guide and educate others in the group. Our focus is primarily on mobile development using Kotlin and Swift. In addition to our projects, we also share information and insights on our blog https://openbytes.dev/, where we publish small posts and articles. If you're looking to learn and collaborate with a community of like-minded developers, OpenBytes is the place for you!
                      """
    var language: Language { .english }
    var imagePath: Path? { "https://avatars.githubusercontent.com/u/92551192?s=200&v=4" }
}

// This will generate your website using the built-in Foundation theme:
try OpenBytesSite()
    .publish(
        using: [
            .installPlugin(.openBytesHighlightJS()),
            .installPlugin(.generateCNAME(with: "openbytes.dev", "www.openbytes.dev")),
            .addMarkdownFiles(),
            .copyResources(),
            .generateHTML(withTheme: .openBytes),
            .generateRSSFeed(including: [.posts]),
            .generateSiteMap(),
            .deploy(using: .gitHub("0xOpenBytes/0xopenbytes.github.io"))
        ]
    )

