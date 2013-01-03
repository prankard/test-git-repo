package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Matt Murton
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var colour:uint = DEBUG::colour;
			
			graphics.beginFill(colour);
			graphics.drawCircle(stage.stageWidth * .5, stage.stageHeight * .5, 200);
			graphics.endFill();
		}
		
	}
	
}