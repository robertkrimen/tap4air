package {
    import mx.core.UIComponent;
    import yzzy.airtap.Test;

    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;

    import flash.desktop.NativeApplication;

    public class test extends UIComponent {
        
        public function test() {
            Test.ok( 1 );
            Test.ok( 1 );
            Test.done();
            NativeApplication.nativeApplication.exit( 0 );
        }
    }
}
