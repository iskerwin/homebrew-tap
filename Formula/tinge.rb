class Tinge < Formula
  desc "Highlight terminal output with regex rules for network devices and servers"
  homepage "https://github.com/iskerwin/tinge"
  url "https://github.com/iskerwin/tinge/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "d4e18a86052d90072a064ebfe711b65e9e7bf403c3d15cb94942c4321d2219ea"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "tinge #{version}", shell_output("#{bin}/tinge --version").chomp
    assert_match "\e[", pipe_output("#{bin}/tinge", "GigabitEthernet0/1 is up\n")
  end
end
