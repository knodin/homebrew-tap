class KnodinAT0121 < Formula
  desc "Source-evidenced local code intelligence with known bounds"
  homepage "https://github.com/DTS-Productivity-Engineering/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.12.1.tgz"
  sha256 "9e4b9cf38fc67ef212237e6010e017ce682bcd526e16a8e0827429baaeaed687"
  license "MIT"

  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    npm = Formula["node@24"].opt_bin/"npm"
    system npm, "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec
    bin.install_symlink libexec/"dist/bin/launcher.js" => "knodin"
  end

  test do
    assert_equal "0.12.1", shell_output("#{bin}/knodin --version").strip
  end
end
