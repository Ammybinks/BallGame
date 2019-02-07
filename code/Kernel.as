package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.getDefinitionByName;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	
	public class Kernel extends MovieClip
	{
		var ball:MovieClip;
		var objectNum:int = 20;
		var objects:Array = new Array();

		var inputField:TextField;
		var input:InputManager;
		
		public function Kernel() {
			addEventListener(Event.ADDED_TO_STAGE, Loaded);
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function Loaded(e:Event)
		{
			input = new InputManager(this);
			
			PlaceTitleText();
			PlaceInputText();
			Loadobjectss();
			
			removeEventListener(Event.ADDED_TO_STAGE, Loaded);
		}
		
		private function Update(e:Event) {
			for(var i:int = 0; i < objects.length; i++)
			{
				objects[i].Update();
			}
		}

		private function Loadobjectss() {
			for(var i:int = 0; i < objectNum; i++)
			{
				ball = new Ball(input);
				ball.x = Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
				stage.addChild(ball);
				
				objects.push(ball);
			}
			
		}
		
		private function PlaceTitleText() {
			var txtHeader:TextField = new TextField();
			txtHeader.type = "dynamic";
			txtHeader.text = "Welcome to the Ball Game";
			txtHeader.border = false;
			txtHeader.selectable = false;
			txtHeader.autoSize = TextFieldAutoSize.LEFT;
			var format:TextFormat = new TextFormat();
			format.size = 20;
			format.color = 0x000000;
			format.font = "Verdana";
			format.align = "center";
			txtHeader.antiAliasType = AntiAliasType.ADVANCED;
			txtHeader.embedFonts = true;

			txtHeader.setTextFormat(format);
			addChild(txtHeader);
			
			txtHeader.x = (stage.stageWidth / 2) - txtHeader.width / 2;
		}
		
		private function PlaceInputText() {
			inputField = new TextField();
			inputField.addEventListener(KeyboardEvent.KEY_UP, UpdateData);
			inputField.x = 10;
			inputField.y = 100;
			inputField.type = "input";
			inputField.text = "Type Here";
			inputField.width = 200;
			inputField.height = 36;
			inputField.border = true;
			var format:TextFormat = new TextFormat();
			format.size = 20;
			format.color = 0x000000;
			format.font = "Verdana";
			format.align = "left";
			inputField.antiAliasType = AntiAliasType.ADVANCED;
			
			inputField.setTextFormat(format);
			addChild(inputField)
		}
		
		private function UpdateData(e:KeyboardEvent)
		{
			if(e.keyCode == 13)
			{
				for(var i:int = 0; i < objects.length; i++)
				{
					objects[i].mPhysicsBody.gravity = Number(inputField.text);
				}
			}
		}
	}
	
}
