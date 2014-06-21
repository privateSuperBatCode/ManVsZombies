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
		
		
		private function setIcon(triggerNowParameter:uint, defaultTriggerParameter:uint, maskingMovieClip:MovieClip)
		{
			maskingMovieClip.myMask.y = -math.percent(triggerNowParameter, defaultTriggerParameter); //myMask = fillupIcon_9.as;
		}
		
		public function setBomb(triggerNowParameter:uint, defaultTriggerParameter:uint)
		{
			setIcon(triggerNowParameter, defaultTriggerParameter, bombMask);
			return;
		}
		
		public function setBeam(triggerNowParameter:uint, defaultTriggerParameter:uint)
		{
			setIcon(triggerNowParameter, defaultTriggerParameter, beamMask);
			return;
		}
		
		public function setShield(triggerNowParameter:uint, defaultTriggerParameter:uint)
		{
			setIcon(triggerNowParameter, defaultTriggerParameter, shieldMask);
			return;
		}
		
		public function setTime(triggerNowParameter:uint, defaultTriggerParameter:uint)
		{
			setIcon(triggerNowParameter, defaultTriggerParameter, timeMask);
			return;
		}
		
		private function doPing(pingMovieClip:MovieClip)
		{
			pingMovieClip.visible = false;
			pingMovieClip.alpha = 1;
			TweenLite.to(pingMovieClip, 1.5, { alpha:0, ease:Linear.easeOut, onComplete:hidePing, onCompleteParams:[pingMovieClip] } );
			return;
		}
		
		private function hidePing(pingMovieClip:MovieClip)
		{
			pingMovieClip.visible = false;
			return;
		}
		
		public function pingBeam()
        {
            doPing(beamPing);
            return;
        }
		
		public function pingBomb()
        {
            doPing(bombPing);
            return;
        }
		
		public function pingTime()
        {
            doPing(timePing);
            return;
        }
		
		public function pingShield()
        {
            doPing(shieldPing);
            return;
        }
		
		public function setLocks(shieldLockBoolean:Boolean, timeLockBoolean:Boolean, beamLockBoolean:Boolean, bombLockBoolean:Boolean)
		{
			if (!shieldLockBoolean)
			{
				shieldLock.visible = false;
			}
			if (!timeLockBoolean)
			{
				timeLock.visible = false;
			}
			if (!beamLockBoolean)
			{
				beamLock.visible = false;
			}
			if (!bombLockBoolean)
			{
				bombLock.visible = false;
			}
			return;
		}
		
		public function setHealth(healthCurrent:uint, healthMax:uint)
		{
			healthBar.scaleX = math.percent(healthCurrent, healthMax) / 100;
			return;
		}
		
		public function setMoney(moneyValueInNumber:uint)
		{
			moneyText.text = String(moneyValueInNumber);
			return;
		}
		
		public function setPoints(pointsValueInNumber:uint)
		{
			pointsText.text = String(pointsValueInNumber);
		}
		
		function frame1
		{
			this.mouseChildren = false;
			return;
		}
		
		public function setToolTip(param1:SharedObject)
		{
			
		}
	}
}