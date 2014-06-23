package mvzClasses.elements.bullets
{
	
	public class BulletFireball extends Bullet
	{
		
		public function BulletFireball()
		{
			isRotating = false;
			animate = loop;
			animDelay = 50;
			endFrame = 8;
			damage = 120;
			sheetID = 13;
			hitWidth = 45;
			hitHeight = 45;
			xOffset = -24;
			yOffset = -24;
			return;
			
		}
		
	}
	
	
}