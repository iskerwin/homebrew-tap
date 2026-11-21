class Tinge < Formula
  desc "Highlight terminal output with regex rules, built in for network devices"
  homepage "https://github.com/iskerwin/tinge"
  url "https://github.com/iskerwin/tinge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a5ed8f7900449b7c8741b3115bbb2242e87b571e75928deb5caaa731ecfb784f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_equal "tinge #{version}", shell_output("#{bin}/tinge --version").chomp
    assert_match "\e[", pipe_output("#{bin}/tinge", "GigabitEthernet0/1 is up\n")
  end
end
