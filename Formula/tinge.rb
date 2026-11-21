class Tinge < Formula
  desc "Highlight terminal output with regex rules, built in for network devices and Linux servers"
  homepage "https://github.com/iskerwin/tinge"
  url "https://github.com/iskerwin/tinge/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "726420d97601303b6a9494461ec4a5423cafcc3573ebb0adf290f29505a33888"
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
