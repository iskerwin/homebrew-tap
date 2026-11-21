class ZshRemote < Formula
  desc "Zsh fzf pickers for SSH, SFTP, Telnet and FTP hosts, plus config backups"
  homepage "https://github.com/iskerwin/zsh-remote"
  url "https://github.com/iskerwin/zsh-remote/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "a97a71ff41f951abacf2cc6d4bd42cbb39caff7b8445f57ec711eeefb54ab709"
  license "MIT"

  depends_on "fzf"
  uses_from_macos "zsh"

  def install
    pkgshare.install Dir["*.zsh"] - ["tests.zsh", "tests-lib.zsh"]
    pkgshare.install "helper", "net-backup.exp"
  end

  def caveats
    <<~EOS
      To activate zsh-remote, add to your ~/.zshrc after compinit:
        source #{opt_pkgshare}/zsh-remote.plugin.zsh
      Optional tools (tinge, lftp, mc, telnet, expect): run remote-doctor
      to see which are installed and how to install the rest.
      For the full look shared with other tools, also install iskerwin/tap/zsh-ui.
    EOS
  end

  test do
    (testpath/"load.zsh").write <<~ZSH
      compdef() { :; }
      ssh-add() { return 1; }
      source #{pkgshare}/zsh-remote.plugin.zsh
      whence ssh-pick >/dev/null && print ok
    ZSH
    assert_equal "ok", shell_output("zsh -f #{testpath}/load.zsh").chomp
  end
end
