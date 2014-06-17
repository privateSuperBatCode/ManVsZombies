package mvzClasses.mechanics
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import mvzClasses.math.*;
	import flash.display.*;
	import flash.net.*;
	import flash.text.*;
	
	public class gameGui extends MovieClip
	{
		public var shieldMask:MovieClip;
		public var moneyText:TextField;
		public var healthBar:MovieClip;
		private var math:gameMath;
		public var bombPing:MovieClip;
		public var shieldLock:MovieClip;
		public var beamMask:MovieClip;
		public var timeMask:MovieClip;
		public var shieldPing:MovieClip;
		public var keyText0:TextField;
		public var keyText1:TextField;
		public var timeLock:MovieClip;
		public var keyText2:TextField;
		public var beamLock:MovieClip;
		public var pointsText:MovieClip;
		public var bombMask:MovieClip;
		public var beamPing:MovieClip;
		public var timePing:MovieClip;
		public var bombLock:MovieClip;
		
		
		public function gameGui()
		{
			
			math = new gameMath();
			//addFrameScript(0, frame1);
			this.mouseEnabled = false;
			this.mouseChildren = false;
			bombPing.visible = false;
			timePing.visible = false;
			shieldPing.visible = false;
			beamPing.visible = false;
			setPoints(0);
			setMoney(0);
			return;
			
		}//end function gameGui
		
		
		private function setIcon(param1:uint, param2:uint, param3:MovieClip)
		{
			
		}
		
	}
}