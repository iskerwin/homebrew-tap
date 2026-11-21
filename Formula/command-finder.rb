class CommandFinder < Formula
  desc "Zsh fzf picker for your own aliases, functions and documented commands"
  homepage "https://github.com/iskerwin/command-finder"
  url "https://github.com/iskerwin/command-finder/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8f02d02fec5b22363f3c82e0e8927bcc659a6913921f360106f376f92cad5abd"
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
