package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	public class Kernel extends MovieClip
	{
		var ball:MovieClip;
		var objectNum:int = 20;
		var object:Array = new Array();
		
		public function Kernel() {
			trace("Hello World!");
			
			addEventListener(Event.ENTER_FRAME, Update);
			
			LoadObjects();
		}
		
		private function Update(e:Event) {
			
			for(var i:int = 0; i < object.length; i++)
			{
				object[i].Update();
			}
		}
		
		private function LoadObjects() {
			for(var i:int = 0; i < objectNum; i++)
			{
				ball = new Ball();
				ball.x = Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
				stage.addChild(ball);
				
				object.push(ball);
			}
			
		}
	}
	
}
