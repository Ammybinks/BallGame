package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	public class Ball extends MovieClip {
		var mPhysicsBody:PhysicsBody;

		var grabbed:Boolean = false;
		
		public function Ball() {
			mPhysicsBody = new PhysicsBody(this);
			
			addEventListener(MouseEvent.MOUSE_DOWN, DragBall);
			addEventListener(MouseEvent.MOUSE_UP, DropBall);
		}
		
		public function Update()
		{
			mPhysicsBody.Update();
		}
		
		private function DragBall(e:Event) {
			startDrag();
			grabbed = true;
		}
		
		private function DropBall(e:Event) {
			stopDrag();
			grabbed = false;
		}
	}
	
}
