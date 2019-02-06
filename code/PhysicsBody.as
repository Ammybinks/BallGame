package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	
	public class PhysicsBody {
		var p:MovieClip;
		
		var radius:Number;
		
		var vX:Number = 5;
		var vY:Number = 0;
		
		var mX:Number = 0;
		var mY:Number = 0;
		
		var elasticity:Number = 0.75;
		var gravity:Number = 0.99;
		var friction:Number = 0.99;
		
		var moveSpeed:int = 5;
		var moveDirection:int = 1;

		public function PhysicsBody(pParent:MovieClip) {
			p = pParent;
			
			radius = p.width / 2;
		}

		public function Update()
		{
			if(!p.grabbed)
			{
				if(mX || mY != 0)
				{
					vX += p.stage.mouseX - mX;
					vY += p.stage.mouseY - mY;
					
					mX = 0;
					mY = 0;
				}
				
				vX *= friction;
				vY *= friction;
				
				vY += gravity;
				
				if(Math.abs(vX) < 0.03)
				{
					vX = 0;
				}
				if(Math.abs(vY) < 0.03)
				{
					vY = 0;
				}
				
				p.x += vX;
				p.rotation += vX;
				
				p.y += vY;
			}
			else
			{
				if(mX && mY == 0)
				{
					vX = 0;
					vY = 0;
				}
				
				mX = p.stage.mouseX;
				mY = p.stage.mouseY;
			}
			
			CheckPosition();
		}
		
		private function CheckPosition()
		{
			if(p.x + radius > p.stage.stageWidth)
			{
				p.x = p.stage.stageWidth - radius;
				
				vX = HitEdge(vX);
				
				moveDirection *= -1;
			}
			if(p.x - radius < 0)
			{
				p.x = 0 + radius;

				vX = HitEdge(vX);
				
				moveDirection *= -1;
			}
			
			
			if(p.y + radius > p.stage.stageHeight)
			{
				p.y = p.stage.stageHeight - radius;
				
				vY = HitEdge(vY);
			}
			if(p.y - radius < 0)
			{
				p.y = 0 + radius;
				
				vY = HitEdge(vY);
			}
		}
		
		private function HitEdge(v:Number)
		{
			v *= elasticity;
			v *= -1;
			
			return v;
		}
	}
}
