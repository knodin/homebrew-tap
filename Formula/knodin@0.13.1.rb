class KnodinAT0131 < Formula
  desc "Source-evidenced local code intelligence with known bounds"
  homepage "https://github.com/DTS-Productivity-Engineering/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.13.1.tgz"
  sha256 "3bf6b04db9b4fc0f9ccff3c87970c522a9c00bc66ba0d5fd5a5a4ef72cae1386"
  license "MIT"

  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    npm = Formula["node@24"].opt_bin/"npm"
    system npm, "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec
    bin.install_symlink libexec/"dist/bin/launcher.js" => "knodin"
  end

  test do
    assert_equal "0.13.1", shell_output("#{bin}/knodin --version").strip
  end
end
