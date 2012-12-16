require 'formula'


class Dtrx < Formula
  homepage 'http://brettcsmith.org/2007/dtrx/'
  url 'http://brettcsmith.org/2007/dtrx/dtrx-7.1.tar.gz'
  version '7.1'
  sha1 '05cfe705a04a8b84571b0a5647cd2648720791a4'

  def install
    print "install"
    # In order to install into the Cellar, the dir must exist and be in the PYTHONPATH.
    temp_site_packages = lib/whichpython/'site-packages'
    mkdir_p temp_site_packages
    ENV['PYTHONPATH'] = temp_site_packages
    

    system "python", "setup.py", "--no-user-cfg",
      "--verbose",
      "install",
      "--force",
      "--install-scripts=#{bin}",
      "--install-lib=#{temp_site_packages}",
      "--install-data=#{share}",
      "--install-headers=#{include}",
      "--record=installed-files.txt"
    
  end
  
  def whichpython
    "python" + `python -c 'import sys;print(sys.version[:3])`.strip
  end

end
