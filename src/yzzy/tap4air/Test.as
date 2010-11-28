package yzzy.tap4air {

    import flash.filesystem.*;
    import flash.desktop.NativeApplication;

    public class Test {

        private static var __singleton__:Test;
        public static function singleton():Test {
            if ( ! __singleton__ ) {
                __singleton__ = new Test();
            }
            return __singleton__;
        }

        public static function ok( ... arguments ):void{
            Test.singleton().ok.apply( Test.singleton(), arguments );
        }

        public static function done( ... arguments ):void{
            Test.singleton().done.apply( Test.singleton(), arguments );
        }

        public static function equal( ... arguments ):void{
            Test.singleton().equal.apply( Test.singleton(), arguments );
        }

        public static function unequal( ... arguments ):void{
            Test.singleton().unequal.apply( Test.singleton(), arguments );
        }

        public static function like( ... arguments ):void{
            Test.singleton().like.apply( Test.singleton(), arguments );
        }

        public static function unlike( ... arguments ):void{
            Test.singleton().unlike.apply( Test.singleton(), arguments );
        }

        public static function exit():void {
            Test.singleton().exit.apply( Test.singleton(), arguments );
        }

        private var _stdout:FileStream;
        private var _stderr:FileStream;
        private var cursor:uint = 0;

        public function Test() {

            _stdout = new FileStream();
            _stdout.open( new File( "/dev/fd/1" ), FileMode.WRITE );

            _stderr = new FileStream();
            _stderr.open( new File( "/dev/fd/2" ), FileMode.WRITE );
        }

        public function _ok( test:*, name:String = null ):void {

            this.cursor += 1;

            if ( test ) {
                this.stdout( 'ok' );
            }
            else {
                this.stdout( 'not ok' );
            }

            this.stdout( ' ' + this.cursor );

            if ( name != null ) {
                name.replace( /#/, '\#' );
                this.stdout( ' - ' + name );
            }

            this.stdout( "\n" );
        }

        public function stdout( output:String ):void {
            this._stdout.writeUTFBytes( output );
        }

        public function ok():void {
            this._ok.apply( this, arguments )
        }

        public function done():void {
            this.stdout( '1..' + this.cursor + "\n" );
        }

        public function equal( have:*, want:*, ... arguments ):void {
            var test:Boolean = have == want;
            arguments.unshift( test );
            this._ok.apply( this, arguments );
        }

        public function unequal( have:*, want:*, ... arguments ):void {
            var test:Boolean = have != want;
            arguments.unshift( test );
            this._ok.apply( this, arguments );
        }

        public function like( have:*, want:RegExp, ... arguments ):void {
            var test:Boolean = want.test( have );
            arguments.unshift( test );
            this._ok.apply( this, arguments );
        }

        public function unlike( have:*, want:RegExp, ... arguments ):void {
            var test:Boolean = ! want.test( have );
            arguments.unshift( test );
            this._ok.apply( this, arguments );
        }

        public function exit():void {
            this.done();
            NativeApplication.nativeApplication.exit( 0 );
        }

        public static function xyzzy():void {

            var stdout:FileStream = new FileStream();
            stdout.open( new File( "/dev/fd/1" ), FileMode.WRITE );
            stdout.writeUTF( "Xyzzy\n" );
            stdout.close();
            NativeApplication.nativeApplication.exit( 0 );
        }

    }

}