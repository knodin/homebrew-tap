class KnodinAT0140 < Formula
  desc "Source-evidenced local code intelligence with known bounds"
  homepage "https://github.com/DTS-Productivity-Engineering/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.14.0.tgz"
  sha256 "d353c657e834e00eed4696624a8b576831d406452b2c39c08968036993cfcc18"
  license "MIT"

  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    npm = Formula["node@24"].opt_bin/"npm"
    system npm, "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec
    bin.install_symlink libexec/"dist/bin/launcher.js" => "knodin"
  end

  test do
    assert_equal "0.14.0", shell_output("#{bin}/knodin --version").strip
  end
end
