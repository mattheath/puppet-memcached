require 'formula'

class Libmemcached < Formula
  homepage 'http://libmemcached.org'
  url 'https://launchpad.net/libmemcached/1.0/1.0.15/+download/libmemcached-1.0.15.tar.gz'
  sha1 'd49ceec8efcc13c2a6ab15416d9caeeeeaa49a48'
  version '1.0.15-boxen1'

  depends_on 'memcached'

  def install
    ENV.append_to_cflags "-undefined dynamic_lookup" if MacOS.version == :leopard

    if MacOS.version > :mountain_lion
      ENV.append 'CXXFLAGS', "-I#{MacOS.sdk_path}/usr/include/c++/4.2.1"
      ENV.append 'LIBS', "#{MacOS.sdk_path}/usr/lib/libstdc++.dylib"
    end

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
