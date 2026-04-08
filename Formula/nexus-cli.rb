class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  version "0.8.3"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-apple-darwin.tar.gz"
  sha256 "1f3f465b7492e0674ea83df98e88b9b4b02f14680e1e12bc9e4c3a5c672eaf7e"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "9e499483e1e9096d5a0b047aec8282222941bec7b021b6a2751f351d5943c24a"
  elsif OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "442db281a32dc585c148328347538f08584741f7254f199e390437e733098f66"
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
