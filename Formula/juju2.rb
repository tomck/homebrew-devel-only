class Juju2 < Formula
  desc "DevOps management tool"
  homepage "https://jujucharms.com/"

  devel do
    url "https://launchpad.net/juju-core/trunk/2.0-beta11/+download/juju-core_2.0-beta11.tar.gz"
    sha256 "4aaaad717106d7b802a9d06ced1723d5a9a2837c831eb75deaec2bd574693ff9"
    version "2.0-beta11"
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
