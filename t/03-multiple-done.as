package {
    import yzzy.tap4air.Test;
    import mx.core.UIComponent;
    import flash.desktop.NativeApplication;

    public class test extends UIComponent {
        
        public function test() {
            Test.ok( 1, 'ok' );
            Test.done();
            Test.done();
            Test.exit();
        }
    }
}
