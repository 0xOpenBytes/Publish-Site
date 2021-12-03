import HighlightJS
import Ink
import Publish

public extension Plugin {
    static func openBytesHighlightJS() -> Self {
        Plugin(name: "HighlightJS") { context in
            context.markdownParser.addModifier(
                .highlightCodeBlocks()
            )
        }
    }
}

public extension Modifier {
    static func highlightCodeBlocks() -> Self {
        let highlighter = HighlightJS()

        return Self(target: .codeBlocks) { html, markdown in
            let begin = markdown.components(separatedBy: .newlines).first ?? "```"
            let language = begin.dropFirst("```".count)

            guard language != "no-highlight" else {
                return html
            }

            let code = markdown
                .dropFirst()
                .drop(while: { !$0.isNewline })
                .dropLast("\n```".count)

            let highlighted = highlighter.highlight(String(code),
                                                    as: String(language))
            let id = "pre-\(highlighted.language)"
            
            return "<pre id=\(id) data-language=\"\(highlighted.language)\" \"><code>\(highlighted.value)\n</code></pre>"
        }
    }
}
