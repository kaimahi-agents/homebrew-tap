# typed: false
# frozen_string_literal: true

# Kaimahi's kmx command-line interface.
class Kmx < Formula
  desc "Agent Builder CLI for Kubernetes"
  homepage "https://github.com/kaimahi-agents/kaimahi"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.2.0/kmx-darwin-arm64", using: :nounzip
      sha256 "ffecd978cde90c7267df8fdb4a5d7fe6c43f85375033ffedc33dabcbd32c7954"
    end

    on_intel do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.2.0/kmx-darwin-amd64", using: :nounzip
      sha256 "5f2f38fb80ed39291f05e5fc139517a794efc90de5f778ae0a0f593f73d84969"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.2.0/kmx-linux-arm64", using: :nounzip
      sha256 "95480d2c1cf41a004e74eabf6685728c033ae472847c63e75d03f44d5c73dcbc"
    end

    on_intel do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.2.0/kmx-linux-amd64", using: :nounzip
      sha256 "44c3a3d48c9c6f6c601aff8a4bcbb3ee4ab5266947ad38f8b0ffbd825e8c7b9e"
    end
  end

  def install
    bin.install Dir["kmx-*"].first => "kmx"
  end

  test do
    assert_equal "kmx v#{version} (release build)",
                 shell_output("#{bin}/kmx version").lines.first.chomp
    assert_match "Create, inspect, and chat with Orka agents",
                 shell_output("#{bin}/kmx agent --help")
  end
end
