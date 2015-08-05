package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import mx.core.ByteArrayAsset;
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	import flash.net.FileReference;
	
    public class Main extends Sprite {
    	
    	private var _loader:Loader;

    	public function Main():void {
            var urlRequest:URLRequest = new URLRequest('PortalPlayer_177.swf');  
            _loader = new Loader();  
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, s_complete);
			_loader.load(urlRequest);

			
    	}
		
		private function s_complete(e:Event):void {
			trace("complete");
    		var myClass:Class = _loader.contentLoaderInfo.applicationDomain.getDefinition("PlayerLoader_tudouPlayer") as Class;
			var byteArray:ByteArrayAsset = new myClass as ByteArrayAsset;
			var fr:FileReference = new FileReference(); 
			fr.save(byteArray,"test.swf");
    	}


    }
}