class KnodinAT090 < Formula
  desc "Source-evidenced local code intelligence with known bounds"
  homepage "https://github.com/DTS-Productivity-Engineering/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.9.0.tgz"
  sha256 "73637d1e6515834f292cf46c8daa5f7d8bfd462484182a5484e2f2b71494d14a"
  license "MIT"

  depends_on "node@24"

  def install
    libexec.install Dir["*"]
    npm = Formula["node@24"].opt_bin/"npm"
    system npm, "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec
    bin.install_symlink libexec/"dist/bin/launcher.js" => "knodin"
  end

  test do
    assert_equal "0.9.0", shell_output("#{bin}/knodin --version").strip
  end
end
