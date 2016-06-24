class Juju2 < Formula
  desc "DevOps management tool"
  homepage "https://jujucharms.com/"

  devel do
    url "https://launchpad.net/juju-core/trunk/2.0-beta10/+download/juju-core_2.0-beta10.tar.gz"
    sha256 "ca1ed827c27b345884aff7e316d54b4929a7e38d6442ffd72d05dd797e8870c8"
    version "2.0-beta10"
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "github.com/juju/juju/cmd/juju"
    system "go", "build", "github.com/juju/juju/cmd/plugins/juju-metadata"
    bin.install "juju", "juju-metadata"
    bash_completion.install "src/github.com/juju/juju/etc/bash_completion.d/juju2"
  end

  test do
    system "#{bin}/juju", "version"
  end
end
