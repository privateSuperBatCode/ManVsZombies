package mvzclasses.elements.bullets
{
	public class BulletGreen04 extends Bullet
	{
		public function BulletGreen04()
		{
			isRotating = false;
			animate = pingPong;
			endFrame = 3;
			damage = 75;
			sheetID = 11;
			hitWidth = 22;
			hitHeight = 22;
			xOffset = -12;
			yOffset = -12;
			return;
		}
	}
}