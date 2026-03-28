class Dexfinder < Formula
  desc "Cross-platform APK/DEX method finder with call chain tracing"
  homepage "https://github.com/JuneLeGency/dexfinder"
  version "0.1.0"
  license "Apache-2.0"

  # Placeholder — will be auto-updated by release CI
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.1.0/dexfinder-darwin-arm64.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.1.0/dexfinder-darwin-amd64.tar.gz"
      sha256 "placeholder"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.1.0/dexfinder-linux-arm64.tar.gz"
      sha256 "placeholder"
    else
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.1.0/dexfinder-linux-amd64.tar.gz"
      sha256 "placeholder"
    end
  end

  def install
    bin.install Dir["dexfinder-*"].first => "dexfinder"
  end

  test do
    assert_match "dexfinder", shell_output("#{bin}/dexfinder --version")
  end
end
