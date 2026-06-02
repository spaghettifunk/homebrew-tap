class Flamingo < Formula
  desc "Terminal-based modal editor written in Zig"
  homepage "https://github.com/spaghettifunk/flamingo"
  url "https://github.com/spaghettifunk/flamingo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "165746d30229bf2e78a9790bed7d2a74254a8467e46991b4dbd668d2b14b992e"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flamingo --version")
    assert_match "Usage", shell_output("#{bin}/flamingo --help")
  end
end
