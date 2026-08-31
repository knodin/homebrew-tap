class KnodinAT0106 < Formula
  desc "Source-evidenced local code intelligence with known bounds"
  homepage "https://github.com/DTS-Productivity-Engineering/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.10.6.tgz"
  sha256 "74905ca1f842c70d8951b961ed6397d31a5e354d20f9632e8727a4951b154bca"
  license "MIT"

  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    npm = Formula["node@24"].opt_bin/"npm"
    system npm, "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec
    bin.install_symlink libexec/"dist/bin/launcher.js" => "knodin"
  end

  test do
    assert_equal "0.10.6", shell_output("#{bin}/knodin --version").strip
  end
end
