cask "argus" do
  version "0.4.3"
  sha256 "31b279ea74b7f4f6d5083572f7f5d2ad225a8d44775ac0ab38ab680c823b1731"

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
