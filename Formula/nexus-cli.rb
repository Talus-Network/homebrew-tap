class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  version "0.8.4"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-apple-darwin.tar.gz"
  sha256 "d6853a532cb1ba5ffe4de1625863f29bc947b5fc3b63a8ec708392210b404448"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "baf1650d546876c25539d0b86e4da48a9d3cf29486eaf896f80ffdb3ee78d720"
  elsif OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a9f4b5653929f03ea541c2099fa24c1e12eb3e897a82e50345b224341f306ae7"
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
