# Homebrew formula for wwk CLI
# To install: brew tap Daylily-Informatics/tap && brew install wwk

class Wwk < Formula
  desc "CLI for WellWhaddyaKnow time tracker"
  homepage "https://github.com/Daylily-Informatics/well-whaddya-know"
  url "https://github.com/Daylily-Informatics/well-whaddya-know/archive/refs/tags/0.3.1.tar.gz"
  sha256 "aea09e708f64355aabe005fe0da04f2657eaa97164265b985535a019037fb54f"
  license "MIT"
  head "https://github.com/Daylily-Informatics/well-whaddya-know.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build",
           "--configuration", "release",
           "--disable-sandbox",
           "-Xswiftc", "-cross-module-optimization"
    bin.install ".build/release/wwk"
    bin.install ".build/release/wwkd"
  end

  def caveats
    <<~EOS
      wwk is the CLI and wwkd is the background agent for WellWhaddyaKnow.

      Install agent as login item (starts automatically at login):
        wwk agent install

      Agent management:
        wwk agent status    # Show agent status
        wwk agent start     # Start agent
        wwk agent stop      # Stop agent
        wwk agent uninstall # Remove login item

      Usage:
        wwk status          # Show current status
        wwk today           # Today's summary
        wwk week            # This week's summary
        wwk --help          # Full command reference

      For the menu bar GUI app:
        brew install --cask daylily-informatics/tap/wellwhaddyaknow
    EOS
  end

  test do
    # Test that the CLI runs and shows help
    assert_match "USAGE: wwk", shell_output("#{bin}/wwk --help")
  end
end
