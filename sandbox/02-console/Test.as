package {
    import flash.system.fscommand;
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.display.MovieClip;
    import flash.display.BitmapData;
    import flash.display.Bitmap
    import flash.events.*;
    import flash.utils.Timer;
    import mx.core.Application;
    import mx.core.UIComponent;
    import mx.events.FlexEvent;
    import mx.collections.*;
    import mx.styles.StyleManager;
    import mx.styles.CSSStyleDeclaration;
    import mx.styles.CSSStyleDeclaration;
    import mx.controls.Button;
    import mx.controls.TextArea;
    import mx.skins.halo.HaloBorder;
    import flash.display.Bitmap;

    public class Test extends Application {
        
        public var $console:TextArea;

        public function Test() {
            super();
            addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete );
        }

        private function onCreationComplete( event:FlexEvent ):void {
            trace( "creationComplete" );
            trace( "width: " + width + " height: " + height );

            log( "Hello, World" );
        }

        private function log( $message:String ):void {
             $console.text += $message;
        }

    }
}
