public function creationComplete():void {

    var stdout:FileStream = new FileStream();
    stdout.open( new File( "/dev/fd/1" ), FileMode.WRITE );
    stdout.writeUTF( "Xyzzy\n" );
    stdout.close();
    flash.desktop.NativeApplication.nativeApplication.exit( 0 );

}
