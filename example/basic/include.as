import yzzy.airtap.Test;

public function creationComplete():void {

    Test.ok( 1 );
    Test.ok( 0 );
    Test.ok( null );
    Test.same( 1, 1, '1 == 1' );
    Test.same( 1, 0, '1 == 1' );
    Test.like( 'Xyzzy', /yzzy/, '~' );
    Test.like( 'Ayzy', /yzzy/, '!~' );
    Test.done();
    flash.desktop.NativeApplication.nativeApplication.exit( 0 );

}
