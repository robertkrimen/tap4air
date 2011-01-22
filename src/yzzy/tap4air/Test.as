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

        public static function ok( ... arguments ):void {
            Test.singleton().ok.apply( Test.singleton(), arguments );
        }

        public static function done( ... arguments ):void {
            Test.singleton().done.apply( Test.singleton(), arguments );
        }

        public static function equal( ... arguments ):void {
            Test.singleton().equal.apply( Test.singleton(), arguments );
        }

        public static function unequal( ... arguments ):void {
            Test.singleton().unequal.apply( Test.singleton(), arguments );
        }

        public static function like( ... arguments ):void {
            Test.singleton().like.apply( Test.singleton(), arguments );
        }

        public static function unlike( ... arguments ):void {
            Test.singleton().unlike.apply( Test.singleton(), arguments );
        }

        public static function exit():void {
            Test.singleton().exit.apply( Test.singleton(), arguments );
        }

        private var _stdout:FileStream;
        private var cursor:uint = 0;
        private var _done:Boolean = false;

        public function Test() {

            _stdout = new FileStream();
            // TODO Check for existence/success in opening stdout?
            _stdout.open( new File( "/dev/stdout" ), FileMode.WRITE );

        }

        public function _ok( test:*, name:String = null ):Boolean {

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
            if ( ! test ) {
                this.stderr( "#   Failed test" + (name == null ? "" : " '" + name + "'") );
            }

            return test ? true : false;
        }

        public function _ok_have_want( have:*, want:*, ... arguments ):Boolean {

            var test:Boolean = this._ok.apply( this, arguments );

            if ( ! test ) {
                this.stderr( "#          got: '" + have + "'" );
                this.stderr( "#     expected: '" + want + "'" );
            }

            return test;
        }

        public function stdout( output:String ):void {
            this._stdout.writeUTFBytes( output );
        }

        public function stderr( output:String ):void {
            trace( output );
        }

        public function ok():void {
            this._ok.apply( this, arguments )
        }

        public function done():void {
            if ( ! this._done ) {
                this._done = true;
                this.stdout( '1..' + this.cursor + "\n" );
            }
        }

        public function equal( have:*, want:*, ... arguments ):void {
            var test:Boolean = have == want;
            arguments.unshift( test );
            arguments.unshift( want );
            arguments.unshift( have );
            if ( ! this._ok_have_want.apply( this, arguments ) ) {
            }
        }

        public function unequal( have:*, want:*, ... arguments ):void {
            var test:Boolean = have != want;
            arguments.unshift( test );
            arguments.unshift( want );
            arguments.unshift( have );
            if ( ! this._ok_have_want.apply( this, arguments ) ) {
            }
        }

        public function like( have:*, want:RegExp, ... arguments ):void {
            var test:Boolean = want.test( have );
            arguments.unshift( test );
            arguments.unshift( want );
            arguments.unshift( have );
            if ( ! this._ok_have_want.apply( this, arguments ) ) {
            }
        }

        public function unlike( have:*, want:RegExp, ... arguments ):void {
            var test:Boolean = ! want.test( have );
            arguments.unshift( test );
            arguments.unshift( want );
            arguments.unshift( have );
            if ( ! this._ok_have_want.apply( this, arguments ) ) {
            }
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
