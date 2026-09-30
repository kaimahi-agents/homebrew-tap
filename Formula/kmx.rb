# typed: false
# frozen_string_literal: true

# Kaimahi's kmx command-line interface.
class Kmx < Formula
  desc "Agent Builder CLI for Kubernetes"
  homepage "https://github.com/kaimahi-agents/kaimahi"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.4.0/kmx-darwin-arm64", using: :nounzip
      sha256 "c45311f3a858c0d586b0aafba6ae0dcc91d4524968a82eb12f1ddba7c406ccf4"
    end

    on_intel do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.4.0/kmx-darwin-amd64", using: :nounzip
      sha256 "4df817419b29557fa1fe72127044cc1da8cb6c9ae8373fa3c4f436ce10413dfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.4.0/kmx-linux-arm64", using: :nounzip
      sha256 "0fd19a132ff285d6eb1a243faaf73c98168e75eed90510e92cf1d8a7a88ce9c1"
    end

    on_intel do
      url "https://github.com/kaimahi-agents/kaimahi/releases/download/v0.4.0/kmx-linux-amd64", using: :nounzip
      sha256 "d09add9895e88c565464c8bab8fb232659afa69147b25b753af82bb2849a217e"
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
