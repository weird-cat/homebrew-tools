require 'formula'


class Phonegap < Formula
  homepage 'http://phonegap.com'
  url 'https://s3.amazonaws.com/phonegap.download/phonegap-2.5.0.zip'
  version '2.5.0'
  sha1 '067cfa0b3ef116414d3b5887e3e33a9807c500ec'

  def install
    print "install"

	# copy files
    system "cp -R ./* #{prefix}/"
    
    
    #create binaries links
    system "mkdir #{bin}"
    
    #android
    system "ln -s #{prefix}/lib/android/bin/create #{bin}/phonegap-android-create"
    
    #blackberry
    system "ln -s #{prefix}/lib/blackberry/bin/create #{bin}/phonegap-blackberry-create"
    
    #ios
    system "ln -s #{prefix}/lib/ios/bin/autotest #{bin}/phonegap-ios-autotest"
    system "ln -s #{prefix}/lib/ios/bin/create #{bin}/phonegap-ios-create"
    system "ln -s #{prefix}/lib/ios/bin/cordova_plist_to_config_xml #{bin}/phonegap-ios-cordova_plist_to_config_xml"
    system "ln -s #{prefix}/lib/ios/bin/diagnose_project #{bin}/phonegap-ios-diagnose_project"
    system "ln -s #{prefix}/lib/ios/bin/replaces #{bin}/phonegap-ios-replaces"
    # system "ln -s #{prefix}/lib/ios/bin/test #{bin}/phonegap-ios-test" #FIXME: this script doesn't work when runned from different working dir
    system "ln -s #{prefix}/lib/ios/bin/uncrustify.sh #{bin}/phonegap-ios-uncrustify.sh"
    system "ln -s #{prefix}/lib/ios/bin/update_cordova_subproject #{bin}/phonegap-ios-update_cordova_subproject"

  end
  

end



