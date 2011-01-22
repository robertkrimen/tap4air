package {
    import yzzy.tap4air.Test;
    import mx.core.UIComponent;
    import flash.desktop.NativeApplication;

    public class test extends UIComponent {
        
        public function test() {
            Test.ok( 0, 'ok' );
            Test.equal( 1, 0, 'equal' );
            Test.unequal( 1, 1, 'unequal' );
            Test.like( "Xyzzy", /zyz/, 'unlike' );
            Test.unlike( "Xyzzy", /zz/, 'like' );
            Test.done();
            Test.exit();
        }
    }
}
