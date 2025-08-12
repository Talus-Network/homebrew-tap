class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v0.2.0/nexus-cli-0.2.0-x86_64-apple-darwin.tar.gz"
  sha256 "5f3c6503d992fed0590f64c1e6971d50f0a5ab325079eb312bfe5fc0ea9decad"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "edda8e3d0d1ae577205d2201ffb6d00cf6619deb6157159e9d64ddb81ff3aa9f"
  elsif OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ed199419840f53bfa899372d4ebd98ed2bfad0a866ee3241b50e7d261f0f07b6"
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
