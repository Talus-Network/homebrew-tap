class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  version "0.5.0"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-apple-darwin.tar.gz"
  sha256 "7977fba026248f26281cbf100ea7ec3a3bbab2b8150b97105fb14ff145adfce5"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "76ccbd2c15ae87d045b93f76cdd9277f8b1121808ef60e3069ea6d82bbeaec30"
  elsif OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "bfcd71ff6965b854162927f6d14aba4abdd47ea1c33d7dc067b0fe90b472e33b"
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
