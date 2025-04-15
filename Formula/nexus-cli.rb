class NexusCli < Formula
  desc "Toolkit for building Smart Agents in Talus Network's Nexus Framework"
  homepage "https://github.com/Talus-Network/nexus-sdk"
  url "https://github.com/Talus-Network/nexus-sdk/releases/download/v0.1.0/nexus-cli-0.1.0-x86_64-apple-darwin.tar.gz"
  sha256 "313d2296040cfa27e91b7b424eac9a1f1faa846b615125349577c47d23261861"
  license "Apache-2.0"

  if OS.linux?
    url "https://github.com/Talus-Network/nexus-sdk/releases/download/v#{version}/nexus-cli-#{version}-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b26290ca239bc9390abd3f15d61aa1ba2452103a12fd042607841645e6b79fa4"
  end

  def install
    bin.install "nexus"
  end

  test do
    assert_equal "nexus-cli #{version}", shell_output("#{bin}/nexus --version").strip
  end
end
