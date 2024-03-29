﻿package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.getDefinitionByName;
	
	public class InputManager {
		var left:Boolean = false;
		var right:Boolean = false;
		var up:Boolean = false;
		var down:Boolean = false;
		
		public function InputManager(pKernel:MovieClip) {
			pKernel.stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyPressed);
			pKernel.stage.addEventListener(KeyboardEvent.KEY_UP, KeyReleased);
		}

		public function Update() {
		}
		
		private function KeyPressed(e:KeyboardEvent) {
			switch (e.keyCode) {
				case 65:
					left = true;
					break;
				case 68:
					right = true;
					break;
				case 87:
					up = true;
					break;
				case 83:
					down = true;
					break;
			}
		}
		
		private function KeyReleased(e:KeyboardEvent) {
			switch (e.keyCode) {
				case 65:
					left = false;
					break;
				case 68:
					right = false;
					break;
				case 87:
					up = false;
					break;
				case 83:
					down = false;
					break;
			}
		}
		
	}
	
}
