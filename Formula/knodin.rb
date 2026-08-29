require "json"

class Knodin < Formula
  desc "Local code-intelligence graph, CLI, and single-tool MCP gateway"
  homepage "https://www.npmjs.com/package/knodin"
  url "https://registry.npmjs.org/knodin/-/knodin-0.10.5.tgz"
  sha256 "2836e3c82db8b9c094daabd4d2a4721b5590e1807b514bfbd9ce9d50f3bb9af3"
  license "MIT"

  depends_on "node"

  def install
    # knodin's packaged CPU path is verified without dependency lifecycle scripts.
    # This avoids optional downloads and native rebuilds from transitive packages.
    ENV["npm_config_ignore_scripts"] = "true"
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/knodin --version").strip

    requests = [
      {
        jsonrpc: "2.0",
        id:      1,
        method:  "initialize",
        params:  {
          protocolVersion: "2025-06-18",
          capabilities:    {},
          clientInfo:      { name: "homebrew-test", version: "1" },
        },
      },
      { jsonrpc: "2.0", method: "notifications/initialized", params: {} },
      { jsonrpc: "2.0", id: 2, method: "tools/list", params: {} },
    ]
    input = requests.map(&:to_json).join("\n") + "\n"
    responses = pipe_output("#{bin}/knodin serve", input).lines.filter_map do |line|
      JSON.parse(line) unless line.strip.empty?
    end

    initialize_response = responses.find { |response| response["id"] == 1 }
    tools_response = responses.find { |response| response["id"] == 2 }
    assert_equal "knodin", initialize_response.dig("result", "serverInfo", "name")
    assert_equal ["knodin"], tools_response.dig("result", "tools").map { |tool| tool["name"] }
  end
end
