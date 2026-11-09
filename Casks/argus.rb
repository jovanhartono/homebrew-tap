cask "argus" do
  version "0.4.1"
  sha256 "668c8af5513b30d1ae2d55cf843060550889849676006da921b897e42cd1c63e"

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
