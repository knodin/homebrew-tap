require "json"

class Reckon < Formula
  desc "Local code-intelligence graph, CLI, and single-tool MCP gateway"
  homepage "https://www.npmjs.com/package/reckon-graph"
  url "https://registry.npmjs.org/reckon-graph/-/reckon-graph-0.3.0.tgz"
  sha256 "373ca7540e745915f195e51f4ed6383374e4df4a2b8663872b2f279380e60989"
  license "MIT"

  depends_on "node"

  def install
    # Reckon's packaged CPU path is verified without dependency lifecycle scripts.
    # This avoids optional downloads and native rebuilds from transitive packages.
    ENV["npm_config_ignore_scripts"] = "true"
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/reckon --version").strip

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
    responses = pipe_output("#{bin}/reckon serve", input).lines.filter_map do |line|
      JSON.parse(line) unless line.strip.empty?
    end

    initialize_response = responses.find { |response| response["id"] == 1 }
    tools_response = responses.find { |response| response["id"] == 2 }
    assert_equal "reckon-graph", initialize_response.dig("result", "serverInfo", "name")
    assert_equal ["reckon"], tools_response.dig("result", "tools").map { |tool| tool["name"] }
  end
end
