class KnodinAT0105 < Formula
  desc "Source-evidenced local code intelligence with known bounds"
  homepage "https://github.com/DTS-Productivity-Engineering/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.10.5.tgz"
  sha256 "2836e3c82db8b9c094daabd4d2a4721b5590e1807b514bfbd9ce9d50f3bb9af3"
  license "MIT"

  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    npm = Formula["node@24"].opt_bin/"npm"
    system npm, "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec
    bin.install_symlink libexec/"dist/bin/launcher.js" => "knodin"
  end

  test do
    assert_equal "0.10.5", shell_output("#{bin}/knodin --version").strip
  end
end
