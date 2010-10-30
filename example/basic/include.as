import yzzy.airtap.Test;

public function creationComplete():void {

    Test.ok( 1 );
    Test.ok( 0 );
    Test.ok( null );
    Test.done();
    flash.desktop.NativeApplication.nativeApplication.exit( 0 );

}
