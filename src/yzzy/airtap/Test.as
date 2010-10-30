package yzzy.airtap {

    import flash.filesystem.*;
    import flash.desktop.NativeApplication;

    public class Test {

        public static function xyzzy():void {

            var stdout:FileStream = new FileStream();
            stdout.open( new File( "/dev/fd/1" ), FileMode.WRITE );
            stdout.writeUTF( "Xyzzy\n" );
            stdout.close();
            NativeApplication.nativeApplication.exit( 0 );
        }

    }

}
