class ZshUi < Formula
  desc "Shared look for zsh tools: output helpers and fzf style, with plain fallbacks"
  homepage "https://github.com/iskerwin/zsh-ui"
  url "https://github.com/iskerwin/zsh-ui/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "58ea9e039bbee3233fe4661d0f0a4ceb7d4c50e4080e8530b3079d0a947d3405"
  license "MIT"

  uses_from_macos "zsh"

  def install
    pkgshare.install "zsh-ui.plugin.zsh", "ui.zsh", "ui-fallback.zsh"
  end

  def caveats
    <<~EOS
      To activate zsh-ui, add to your ~/.zshrc before your other zsh tools:
        source #{opt_pkgshare}/zsh-ui.plugin.zsh
    EOS
  end

  test do
    assert_equal "ok", shell_output("zsh -f -c 'source #{pkgshare}/zsh-ui.plugin.zsh && " \
                                    "whence _ui_fzf_keys >/dev/null && print ok'").chomp
  end
end
