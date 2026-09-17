class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v2.1.0/nexus-cli-2.1.0-x86_64-apple-darwin.tar.gz"
  sha256 "0fa5d79fe84da49b7f5f3af4267bed46e8821c1544675f6d8cf9ea5ece769b2d"
  license "Apache-2.0"

  if OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6775b50e50effe21c4d44f2504fbc1e44df747fcbaa20a0e53fe78b279091360"
  elsif Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "19d9c625b969246cb53290aba29714094527d2e17f71a02668737e0ca57c36fb"
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
