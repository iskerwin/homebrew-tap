class ZshRemote < Formula
  desc "SSH, SFTP, Telnet and FTP host pickers, ssh-agent manager and config backups for zsh"
  homepage "https://github.com/iskerwin/zsh-remote"
  url "https://github.com/iskerwin/zsh-remote/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "db472be49bdcaeeb0266a615da8b31c4f1ea48a05ce444c797b1facb87d6e73a"
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
      Optional: lftp (SFTP / FTP), mc (two-pane browser), expect (net-backup).
      For the full look shared with other tools, also install iskerwin/tap/zsh-ui.
    EOS
  end

  test do
    assert_equal "ok", shell_output("zsh -f -c 'compdef() { :; }; ssh-add() { return 1; }; " \
                                    "source #{pkgshare}/zsh-remote.plugin.zsh && whence ssh-pick >/dev/null && print ok'").chomp
  end
end
