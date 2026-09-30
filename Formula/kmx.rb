# typed: false
# frozen_string_literal: true

# Kaimahi's kmx command-line interface.
class Kmx < Formula
  desc "Agent Builder CLI for Kubernetes"
  homepage "https://github.com/kaimahi-agents/kaimahi"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.3.0/kmx-darwin-arm64", using: :nounzip
      sha256 "3b36e698f00e1f15b8c8e11c587baded36aa25c4d3f491b4c72977d36ec486a3"
    end

    on_intel do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.3.0/kmx-darwin-amd64", using: :nounzip
      sha256 "94b29cb28331cadfa62823fae3a22ddddbde94b1709bffde250f8b3ac473bbab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.3.0/kmx-linux-arm64", using: :nounzip
      sha256 "9919988bc119dd556d8a48b2bea02a9bc7c9461628e116d0c025332bdc52fdcc"
    end

    on_intel do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.3.0/kmx-linux-amd64", using: :nounzip
      sha256 "7f9ecafdea7171ed3c49023df666a71652ad05c1aa735ffa60354d4ddab1b877"
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
