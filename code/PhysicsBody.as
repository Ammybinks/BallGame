package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import flash.geom.Vector3D;
	
	public class PhysicsBody {
		var p:MovieClip;
		
		var radius:Number;
		var mass:Number;
		
		var v:Vector3D = new Vector3D(5, 0, 0);
		var s:Vector3D = new Vector3D(0.3, 1.8, 0);
		var m:Vector3D = new Vector3D(0, 0, 0);
		
		var elasticity:Number = 0.85;
		var gravity:Number = 1;
		var friction:Number = 0.99;
		
		
		public function PhysicsBody(pParent:MovieClip, pMass:Number) {
			p = pParent;
			
			mass = (pMass / 2) + 1;
			radius = p.width / 2;
		}

		public function Update()
		{
			CheckInput();
			
			if(!p.grabbed)
			{
				if(m.x || m.y != 0)
				{
					v.x += p.stage.mouseX - m.x;
					v.y += p.stage.mouseY - m.y;
					
					m.x = 0;
					m.y = 0;
				}
				
				v.x *= friction;
				v.y *= friction;
				
				v.y += (gravity * mass);
				
				if(Math.abs(v.x) < 0.03)
				{
					v.x = 0;
				}
				
				p.x += v.x;
				p.rotation += v.x;
				
				p.y += v.y;
			}
			else
			{
				if(m.x && m.y == 0)
				{
					v.x = 0;
					v.y = 0;
				}
				
				m.x = p.stage.mouseX;
				m.y = p.stage.mouseY;
			}
			
			CheckPosition();
		}
		
		private function CheckInput()
		{
			if(p.mInput.left)
			{
				v.x -= s.x;
			}
			if(p.mInput.right)
			{
				v.x += s.x;
			}
			if(p.mInput.up)
			{
				v.y -= s.y;
			}
			if(p.mInput.down)
			{
				v.y += s.y;
			}
		}
		
		private function CheckPosition()
		{
			if(p.x + radius > p.stage.stageWidth)
			{
				p.x = p.stage.stageWidth - radius;
				
				v.x = HitEdge(v.x);
			}
			if(p.x - radius < 0)
			{
				p.x = 0 + radius;

				v.x = HitEdge(v.x);
			}
			
			
			if(p.y + radius > p.stage.stageHeight)
			{
				p.y = p.stage.stageHeight - radius;
				
				v.y = HitEdge(v.y);
			}
			if(p.y - radius < 0)
			{
				p.y = 0 + radius;
				
				v.y = HitEdge(v.y);
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
