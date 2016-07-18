class Juju2 < Formula
  desc "DevOps management tool"
  homepage "https://jujucharms.com/"

  devel do
    url "https://launchpad.net/juju-core/trunk/2.0-beta12/+download/juju-core_2.0-beta12.tar.gz"
    sha256 "1d65b020ce9c79b281ca3e17eadfb3451912052114db3c59040b151ed8464e78"
    version "2.0-beta12"
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "github.com/juju/juju/cmd/juju"
    system "go", "build", "github.com/juju/juju/cmd/plugins/juju-metadata"
    bin.install "juju" => "juju2", "juju-metadata" => "juju-metadata2"
    bash_completion.install "src/github.com/juju/juju/etc/bash_completion.d/juju-2.0"
  end

  test do
    system "#{bin}/juju", "version"
  end
end
