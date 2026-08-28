class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v2.0.0/nexus-cli-2.0.0-x86_64-apple-darwin.tar.gz"
  sha256 "035648bfdab4be25f8c4a7063587a2b4c8950761bd412fff44c42983a6cfc86d"
  license "Apache-2.0"

  if OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "249a7aef40a1329124967f2d81b74fed56576e7914510409bd54407865b483cd"
  elsif Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "d70296afe9d6b3e02036c876055ae26d596e9e18a11e9c6847eb0ede06b4c615"
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
