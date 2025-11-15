class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v0.3.0/nexus-cli-0.3.0-x86_64-apple-darwin.tar.gz"
  sha256 "d8dd27b3560b16bcd9256f13e39a2be40817618ea97bf7585ae71224c80eefe3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "3cdb0ec479b073cc581eccff3ad50e72dfb8fb7958d5cf26b5f132b1a3a2de2a"
  elsif OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "376972a46dab79e8439ac263753ac4ce20da6ed8ecd80ea3566be35ff19c9b88"
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
