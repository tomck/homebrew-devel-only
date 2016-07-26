class Juju2 < Formula
  desc "DevOps management tool"
  homepage "https://jujucharms.com/"

  devel do
    url "https://launchpad.net/juju-core/trunk/2.0-beta13/+download/juju-core_2.0-beta13.tar.gz"
    sha256 "36be9ff1266b430b43749cc5eeed14d6fa9ece306ed135aca72e82daab7554fc"
    version "2.0-beta13"
  end

  depends_on "go" => :build
  conflicts_with "juju", :because => "juju and juju2 cannot be installed simultaneously, and juju environments aren't compatible with juju2"

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "github.com/juju/juju/cmd/juju"
    system "go", "build", "github.com/juju/juju/cmd/plugins/juju-metadata"
    bin.install "juju", "juju-metadata"
    bash_completion.install "src/github.com/juju/juju/etc/bash_completion.d/juju-2.0"
  end

  test do
    system "#{bin}/juju", "version"
  end
end
