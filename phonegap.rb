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
    system "ln -s #{prefix}/lib/ios/bin/test #{bin}/phonegap-ios-test"
    system "ln -s #{prefix}/lib/ios/bin/uncrustify.sh #{bin}/phonegap-ios-uncrustify.sh"
    system "ln -s #{prefix}/lib/ios/bin/update_cordova_subproject #{bin}/phonegap-ios-update_cordova_subproject"

  end
  
  def patches
    # fixes something small
    DATA
  end
  
end

__END__
diff --git a/lib/ios/bin/create b/lib/ios/bin/create
index bef0f57..950945c 100755
--- a/lib/ios/bin/create
+++ b/lib/ios/bin/create
@@ -50,13 +50,25 @@ if [ $# -lt 3 ]; then
 	usage
 fi
 
-# the two lines below are to get the current folder, and resolve symlinks
+# lines below are to get the current folder, and resolve symlinks
+WORKINGDIR=$(pwd)
 SCRIPT="$0"
 # need this for relative symlinks
-while [ -h "$SCRIPT" ] ; do
-   SCRIPT=`readlink "$SCRIPT"`
+cd `dirname $SCRIPT`
+SCRIPT=`basename $SCRIPT`
+
+# Iterate down a (possible) chain of symlinks
+while [ -L "$SCRIPT" ]
+do
+    SCRIPT=`readlink $SCRIPT`
+    cd `dirname $SCRIPT`
+    SCRIPT=`basename $SCRIPT`
 done
 
+SCRIPT=$(pwd -P)/$SCRIPT
+
+cd $WORKINGDIR;
+
 BINDIR=$( cd "$( dirname "$SCRIPT" )" && pwd )
 CORDOVALIB_DIR="$BINDIR/../CordovaLib"
 CDV_VER=$(cat $CORDOVALIB_DIR/VERSION)
diff --git a/lib/ios/bin/test b/lib/ios/bin/test
index 3f7df13..07e3296 100755
--- a/lib/ios/bin/test
+++ b/lib/ios/bin/test
@@ -21,13 +21,25 @@
 
 
 
-# the two lines below are to get the current folder, and resolve symlinks
+# lines below are to get the current folder, and resolve symlinks
+WORKINGDIR=$(pwd)
 SCRIPT="$0"
 # need this for relative symlinks
-while [ -h "$SCRIPT" ] ; do
-   SCRIPT=`readlink "$SCRIPT"`
+cd `dirname $SCRIPT`
+SCRIPT=`basename $SCRIPT`
+
+# Iterate down a (possible) chain of symlinks
+while [ -L "$SCRIPT" ]
+do
+    SCRIPT=`readlink $SCRIPT`
+    cd `dirname $SCRIPT`
+    SCRIPT=`basename $SCRIPT`
 done
 
+SCRIPT=$(pwd -P)/$SCRIPT
+
+cd $WORKINGDIR;
+
 BINDIR=$( cd "$( dirname "$SCRIPT" )" && pwd )
 TESTDIR=$BINDIR/mobile-spec-test
 
