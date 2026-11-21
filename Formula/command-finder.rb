class CommandFinder < Formula
  desc "Zsh fzf picker for your own aliases, functions and documented commands"
  homepage "https://github.com/iskerwin/command-finder"
  url "https://github.com/iskerwin/command-finder/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "565c45dea513da0c06158080fa40f8fa1a38d16977ac754d566f4de5dca63816"
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
      Run cf-doctor to check the setup.
    EOS
  end

  test do
    assert_equal "command_finder: function\ncf-doctor: function",
      shell_output("zsh -f -c 'source #{pkgshare}/command-finder.plugin.zsh && whence -w command_finder cf-doctor'").chomp
  end
end
