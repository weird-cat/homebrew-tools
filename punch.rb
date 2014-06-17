require 'formula'


class Punch < Formula
  homepage 'https://github.com/weird-cat/punch'
  url 'https://github.com/weird-cat/punch/archive/v0.2.tar.gz'
  version '0.2'
  sha1 '95f6f5dce5880313941211497d99e3ec398ba5f5'

  def install
    print "install"
    bin.install "punch"
  end

end
