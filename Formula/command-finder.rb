class CommandFinder < Formula
  desc "Zsh fzf picker for your own aliases, functions and documented commands"
  homepage "https://github.com/iskerwin/command-finder"
  url "https://github.com/iskerwin/command-finder/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b4c3b666463cfd68e2371e0b9d63c1acb8b09a88e61569b419d1b8f9ab2ace92"
  license "MIT"

  depends_on "fzf"
  uses_from_macos "zsh"

  def install
    pkgshare.install "command-finder.plugin.zsh", "core.zsh", "lib", "sources", "ui"
  end

  def caveats
    <<~EOS
      To activate command-finder, add to your ~/.zshrc:
        source #{opt_pkgshare}/command-finder.plugin.zsh
      For the full look shared with other tools, also install iskerwin/tap/zsh-ui.
    EOS
  end

  test do
    assert_equal "command_finder: function",
      shell_output("zsh -f -c 'source #{pkgshare}/command-finder.plugin.zsh && whence -w command_finder'").chomp
  end
end
