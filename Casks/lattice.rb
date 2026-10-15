# Homebrew cask template — scripts/release.sh fills in the version and sha256 → build/lattice.rb,
# which goes into the tap (github.com/ijcodelabs/homebrew-tap, Casks/lattice.rb).
#   brew install --cask ijcodelabs/tap/lattice
cask "lattice" do
  version "0.1.0"
  sha256 "b49d2599bc74279061ba6b87d3a7e18c6981f029892d19f02cceac754770f851"

  url "https://github.com/ijcodelabs/lattice/releases/download/v#{version}/Lattice-#{version}.zip"
  name "Lattice"
  desc "Keyboard-first tiling window manager"
  homepage "https://github.com/ijcodelabs/lattice"

  depends_on macos: ">= :sequoia"

  app "Lattice.app"
  binary "#{appdir}/Lattice.app/Contents/MacOS/Lattice", target: "lattice"

  uninstall quit: "com.ijcodelabs.lattice"

  zap trash: [
    "~/.config/lattice",
    "~/Library/Application Support/Lattice",
    "~/Library/Logs/Lattice",
  ]
end
