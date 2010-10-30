package {
    import flash.display.Sprite;
    import flash.system.fscommand;
   
    public class test extends Sprite {
        
        public function test() {
            trace( "Hello, World!" );
            trace( "Bye, World!" );
            fscommand( "quit" );
        }
    }
}
