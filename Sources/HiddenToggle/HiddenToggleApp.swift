import SwiftUI
import AppKit

@main
struct HiddenToggleApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var isShowingHidden = false

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide dock icon
        NSApp.setActivationPolicy(.accessory)

        // Check current state
        isShowingHidden = currentFinderState()

        // Create menu bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusItem.button {
            button.action = #selector(toggleHiddenFiles)
            button.target = self
            updateIcon()
        }

        buildMenu()
    }

    func currentFinderState() -> Bool {
        let task = Process()
        task.launchPath = "/usr/bin/defaults"
        task.arguments = ["read", "com.apple.finder", "AppleShowAllFiles"]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = Pipe()
        try? task.run()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        return output == "1" || output.lowercased() == "true" || output.lowercased() == "yes"
    }

    func updateIcon() {
        if let button = statusItem.button {
            let symbolName = isShowingHidden ? "eye" : "eye.slash"
            button.image = NSImage(systemSymbolName: symbolName, accessibilityDescription: "Hidden Files Toggle")
        }
    }

    func buildMenu() {
        let menu = NSMenu()

        let stateText = isShowingHidden ? "Fichiers cachés : visibles" : "Fichiers cachés : masqués"
        let stateItem = NSMenuItem(title: stateText, action: nil, keyEquivalent: "")
        stateItem.isEnabled = false
        menu.addItem(stateItem)

        menu.addItem(NSMenuItem.separator())

        let toggleItem = NSMenuItem(
            title: isShowingHidden ? "Masquer les fichiers cachés" : "Afficher les fichiers cachés",
            action: #selector(toggleHiddenFiles),
            keyEquivalent: "h"
        )
        toggleItem.target = self
        menu.addItem(toggleItem)

        menu.addItem(NSMenuItem.separator())

        let quitItem = NSMenuItem(title: "Quitter", action: #selector(quitApp), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)

        statusItem.menu = menu
    }

    @objc func toggleHiddenFiles() {
        isShowingHidden.toggle()

        // Set the Finder preference
        let task = Process()
        task.launchPath = "/usr/bin/defaults"
        task.arguments = ["write", "com.apple.finder", "AppleShowAllFiles", "-bool", isShowingHidden ? "true" : "false"]
        try? task.run()
        task.waitUntilExit()

        // Restart Finder to apply
        let killTask = Process()
        killTask.launchPath = "/usr/bin/killall"
        killTask.arguments = ["Finder"]
        try? killTask.run()
        killTask.waitUntilExit()

        updateIcon()
        buildMenu()
    }

    @objc func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}
