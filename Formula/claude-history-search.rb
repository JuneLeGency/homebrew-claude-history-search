class ClaudeHistorySearch < Formula
  desc "Search & browse Claude Code conversation history with native Qt GUI"
  homepage "https://github.com/JuneLeGency/claude-history-search"
  url "https://github.com/JuneLeGency/claude-history-search.git", tag: "v0.4.0", using: :git
  license "MIT"

  depends_on "cmake" => :build
  depends_on "qt"

  def install
    cd "qt" do
      system "cmake", "-S", ".", "-B", "build",
             "-DCMAKE_BUILD_TYPE=Release",
             *std_cmake_args
      system "cmake", "--build", "build"
      # Install the app bundle
      prefix.install "build/claude-his-search.app"
      # Create a CLI symlink
      bin.write_exec_script prefix/"claude-his-search.app/Contents/MacOS/claude-his-search"
    end
  end

  def caveats
    <<~EOS
      claude-history-search has been installed as a macOS app bundle.

      To launch:
        open #{prefix}/claude-his-search.app

      Or from terminal:
        claude-his-search

      Optional: For semantic search, install the Python embedding backend:
        cd $(brew --prefix claude-history-search)
        pip install sentence-transformers mlx-embeddings
    EOS
  end

  test do
    assert_predicate prefix/"claude-his-search.app/Contents/MacOS/claude-his-search", :exist?
  end
end
