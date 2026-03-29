class Dexfinder < Formula
  desc "Cross-platform APK/DEX method finder with call chain tracing"
  homepage "https://github.com/JuneLeGency/dexfinder"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.3.0/dexfinder-darwin-arm64.tar.gz"
      sha256 "4833818a55c39abf574503ff5cbe72cc0c7eda52d739ea3d7a9de6f52c314c27"
    else
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.3.0/dexfinder-darwin-amd64.tar.gz"
      sha256 "5bd9dceb46db763822b7b1dd8aa356ec90484ecfd5ef07114ef7ab7c5d942d61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.3.0/dexfinder-linux-arm64.tar.gz"
      sha256 "c56e5d5e8f770052f3461a2bda9f9cbf54dbabf6df80d00368a4afb55f0b500d"
    else
      url "https://github.com/JuneLeGency/dexfinder/releases/download/v0.3.0/dexfinder-linux-amd64.tar.gz"
      sha256 "cb742097823c5b25f8b2525324356dad718e0c62cf80ce054253c9dbcffc9132"
    end
  end

  def install
    bin.install Dir["dexfinder-*"].first => "dexfinder"
  end

  test do
    assert_match "dexfinder", shell_output("#{bin}/dexfinder --version")
  end
end
