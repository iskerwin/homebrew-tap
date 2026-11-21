class CommandFinder < Formula
  desc "Zsh fzf picker for your own aliases, functions and documented commands"
  homepage "https://github.com/iskerwin/command-finder"
  url "https://github.com/iskerwin/command-finder/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "dd3ba3b5f7ce8d864be6d7507b5aea6ac5b2884a40aed8ea3c8db5c480a030aa"
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
    EOS
  end

  test do
    assert_equal "command_finder: function",
      shell_output("zsh -f -c 'source #{pkgshare}/command-finder.plugin.zsh && whence -w command_finder'").chomp
  end
end
