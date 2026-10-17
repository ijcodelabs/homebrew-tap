# Homebrew cask template — scripts/release.sh fills in the version and sha256 → build/lattice.rb,
# which goes into the tap (github.com/ijcodelabs/homebrew-tap, Casks/lattice.rb).
#   brew install --cask ijcodelabs/tap/lattice
cask "lattice" do
  version "0.1.3"
  sha256 "e65737c4f501ce029eb20f59a6f1318fa1d4431e5a993710e915b8fdf1d9be3c"

  url "https://github.com/ijcodelabs/lattice/releases/download/v#{version}/Lattice-#{version}.zip"
  name "Lattice"
  desc "Keyboard-first tiling window manager"
  homepage "https://github.com/ijcodelabs/lattice"

  depends_on macos: :sequoia

  app "Lattice.app"
  binary "#{appdir}/Lattice.app/Contents/MacOS/Lattice", target: "lattice"

  uninstall quit: "com.ijcodelabs.lattice"

  zap trash: [
    "~/.config/lattice",
    "~/Library/Application Support/Lattice",
    "~/Library/Logs/Lattice",
  ]
end
