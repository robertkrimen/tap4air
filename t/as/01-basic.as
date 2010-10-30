package {
    import yzzy.tap4air.Test;
    import mx.core.UIComponent;
    import flash.desktop.NativeApplication;

    public class test extends UIComponent {
        
        public function test() {
            Test.ok( 1, 'ok' );
            Test.equal( 1, 1, 'equal' );
            Test.unequal( 1, 2, 'unequal' );
            Test.like( 'Xyzzy', /yzzy/, 'like' );
            Test.unlike( 'Xyzzy', /Y/, 'unlike' );
            Test.done();
            NativeApplication.nativeApplication.exit( 0 );
        }
    }
}
