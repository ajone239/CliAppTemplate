import ArgumentParser
import Foundation
import TemplateCore

@main
struct TemplateCli: AsyncParsableCommand {
    @Argument(help: "Name: say hello to")
    var name: String

    func run() async throws {
        print(TemplateLibFunc())
        print("Hello, \(name)!")
    }
}
