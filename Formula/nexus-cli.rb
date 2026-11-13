class NexusCli < Formula
  desc "CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v2.2.0/nexus-cli-2.2.0-x86_64-apple-darwin.tar.gz"
  sha256 "c970e176d9e55cdec1d68eb7382b7b7c858386a49c8a81db970d57bbedb23cf5"
  license "Apache-2.0"

  if OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "29a74f89c802d05e7e1b16028b0ff61dab3960b52de4b8a6e844e76c905f74b6"
  elsif Hardware::CPU.arm?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "05cf1845f5a4d6d70f54876eeb2add6ac6a5240f1a8dd9f50b9dbd058d548637"
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
