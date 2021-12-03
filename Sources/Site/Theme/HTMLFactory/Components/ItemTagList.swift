import Plot
import Publish

struct ItemTagList<Site: Website>: Component {
    var item: Item<Site>
    var site: Site
    
    var body: Component {
        List(item.tags.ordered()) { tag in
            ListItem {
                Link(
                    tag.string,
                    url: site.path(for: tag).absoluteString
                )
            }
            .class("tag")
            .id(tag.cssID ?? "")
        }
        .class("tag-list")
    }
}
