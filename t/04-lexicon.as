package {
    import yzzy.tap4air.Test;
    import mx.core.UIComponent;
    import flash.desktop.NativeApplication;

    public class test extends UIComponent {
        
        public function test() {
            Test.ok( 1, 'ok' );
            Test.equal( 1, 1, 'equal' );
            Test.unequal( 1, 0, 'unequal' );
            Test.like( "Xyzzy", /zz/, 'like' );
            Test.unlike( "Xyzzy", /zyz/, 'unlike' );
            Test.done();
            Test.exit();
        }
    }
}
