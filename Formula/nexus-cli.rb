class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v2.1.1/nexus-cli-2.1.1-x86_64-apple-darwin.tar.gz"
  sha256 "c9abd587b9b78193013ef872af59f452090c1c955a58947e3ad61df91759a344"
  license "Apache-2.0"

  if OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c954437c2be84e814abd6e4c6e266ccf4c14d7d23c669609154574d4ec9e0fbe"
  elsif Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "df22c1a4c2e7241c1a23b0b0971668b328553c62da4eb72b14fdf5bd48cef968"
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
