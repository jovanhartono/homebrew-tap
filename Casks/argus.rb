cask "argus" do
  version "0.4.2"
  sha256 "2b50ab6ad5fe01c0d8b6a14065f508cdcdb0029fc8cd9e464d6fb010bba30594"

  url "https://github.com/jovanhartono/argus/releases/download/v#{version}/Argus.dmg"
  name "Argus"
  desc "Fast, light file and app launcher"
  homepage "https://github.com/jovanhartono/argus"

  depends_on macos: :ventura

  app "Argus.app"

  # Argus isn't notarized; without this macOS blocks every install and upgrade until Open Anyway.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Argus.app"], must_succeed: false
  end

  uninstall quit: "io.github.jovanhartono.argus"

  zap trash: [
    "~/.config/argus",
    "~/Library/Application Support/io.github.jovanhartono.argus",
    "~/Library/Preferences/io.github.jovanhartono.argus.plist",
  ]
end
