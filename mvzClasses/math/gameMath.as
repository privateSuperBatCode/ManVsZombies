package mvzClasses.math //create the package.
{
	import flash.geom.*; //import flash.geom for using points.
	
	public class gameMath extends Object //gameMath class, need not extend object, but still done here, no reason particular. 
	{
		public function gameMath() //Constructor, returns nothing, no need to specify it, but still done here.
		{
			return; //returns nothing, hence not needed to define a constructor, but still, done for no reason.
			
		} //end Constructor.
		
		public function pointDistanceSquare(pointOneX:int, pointOneY:int, pointTwoX:int, pointTwoY:int) :Number
		{
			//This function takes 4 parameters, the X and Y co-ordinate of two points
			//and then finds the distance square between them, using distance formula
			// NOTE: the distance formula is √(x2-x1)² + (y2-y1)²
			//but to find the distance SQUARE, we sqaure the above formula and get
			//(x2-x1)² + (y2-y1)² ..hence, given below. it returns the value in number.
			
			return Math.pow(pointTwoX - pointOneY, 2) + Math.pow(pointTwoY - pointOneX, 2);
			//Math.pow function takes a number as first param, and the power as the second param.
			
		} //end pointDistanceSquare function.
		
		public function angleBetweenPoints(pointOneX:int, pointOneY:int, pointTwoX:int, pointTwoY:int):Number
		{
			// This function is used for finding the angle between two points
			// by using the Math.atan2 method and returns the value in radians
			// we will write a seperate function to convert the radians 
			// into degrees later. It returns the value in number
			
			return Math.atan2(pointTwoY - pointOneY, pointTwoX - pointOneX);
		} //end angleBetweenPoints function
		
		public function percent(numerator:int, denominator:int)
		{
			// calculates the percentage of two numbers
			
			if ( numerator < 0 ) //check if the numerator is less than 0 , that is numerator is negative
			{
				numerator = 0; //make it non-negative by turing it to 0, so that we get proper % and not a negative one
							   //because negative numerators percentage wrt anything is always 0.
			}
			
			return numerator / denominator * 100; //return the percentage by using percent formula.
		} //end percentage function.
		
		public function velocityFromAngle(velocity:Number, angleComponent:Number) //TOTO:Diagram
		{
			// The given function breaks the velocity of a point
			// into its x and y components, in short the velocity of a given arbitary point in space or plane is
			// vx = v * cos(angle) for the X component (more in figure)
			// vy = v * sin(angle) for the Y component (more in figure)
			// Also the overall velocity then is v = vx+vy
			// which is , v = (v * cos(angle)) + (v * sin(angle))
			
			return [velocity * Math.cos(angleComponent), velocity * Math.sin(angleComponent)];
			
			//The given function returns the vx and vy component, hence for example,
			// if the velocity is 1 and the angle (SHOULD BE TAKEN IN RADIANS) is 0.52359 (which is, 30 degrees)
			// then the output will return 0.8660297915502412,0.4999924000896871
			
		}//end function velocityFromAngle
		
		public function radToDeg(angleInRadians:Number)
		{
			//This function is used to convert any angle from radians to degrees, by using hte formula
			// angle(in degrees) = angle(in radians) * 180/PI
			
			return angleInRadians * 180 / Math.PI;
			
		}
		
		public function randomNumber(randomSeedOne:uint, randomSeedTwo:uint)
		{
			//This function is used for generating a random number
			//This function is used so that more randomness is provided
			// taking a random value with the random function
			// then multiplying it with a random "seed" value (any value)
			// since the math.random function only returns a value between 0 and 1, we multiply to get a bigger value
			// hence the value obtained could be in decimals, so we floor the value (bring to lower denomination)
			// by using the math.floor function. We then add this value to another "seed" value (any value) to give
			// more randomness to the function.
			
			return randomSeedOne + Math.floor(Math.random() * randomSeedTwo);
			
		}//end function randomNumber
		
		public function chance(chanceSeed:uint) : Boolean
		{
			//The following function takes a "seed value" (any value) checks whether it is less than math.random * 100
			// (math.random returns a value between 0 to 1, hence say in an instance we get a value such as 0.63, so we
			// multiply that by 100, and we get 63, then this ufunction cheks if the seed value is greater than this numeber,
			// that is, 63, or not. i so, then it returns true, else it returns false).
			
			if (Math.random  * 100 < chanceSeed)
			{
				return true;
			}
			
			return false;
		}//end function chance
		
		public function randomGetFromArray(arrayToFetchFrom:Array)
        {
			//The following function returns a random value from an array. TO be more precise, it returns the index,
			// by flooring math.random into the total length. For eg, length of array is 10, math.random returns 
			// 0.54, hence we multiply it by array length, we get 5.4, and then we floor it, hence we get 5.
			// therefore this function returns the value of the array at index 5.
            return arrayToFetchFrom[Math.floor(Math.random() * arrayToFetchFrom.length)];
        }// end function
		
		public function boxCollisionDetectionMathMechanic(objectOneX:int, objectOneY:int, objectTwoX:int, objectTwoY:int, objectOneHitWidth:uint, objectOneHitHeight:uint, objectTwoHitWidth:uint, objectTwoHitHeight:uint): Boolean // TODO:Diagram
		{
			// I personally do not understand this function totally, tried to decipher it at my level best and this is the conclusion:
			// This function is only used 4 times throughout the game, and it is used for taking x and y co-ordinates of an object
			// and the x and y co- ordinates of the other object, then it takes the hitbox width and height of both objectOne
			// and objectTwo. Then it halves and floors the addition of both height and width of both the objects.
			// This froms the bounding box for testing the collision later. then this function further 
			// substracts the objectOne x location with objectTwo x location, then objectOne y location with objectTwo y location.
			// (if the substraction between the points is negative it turns it into positive because distance cannot be negative)
			// later it compares the whether teh substracted Obecjt's x and y value are lesser than that of the helf(or average)
			// value of hte height and width of both the objects. If it is so, then the x and y wil be in a box (imaginary)
			// formed by taing the average of the objects width and height. If not then it will be outside. if the objects x and 
			// y are in teh box then there is a collision, if not, then there is no collision.
			
			var averageObjectsWidth:Number = 0;
			var averageObjectsHeight:Number = 0;
			var objectXSubstraction:Number = 0;
			var objectYSubstraction:Number = 0;
			var convertXSubstractionToPositive:Number = 0;
			var convertYSubstractionToPositive:Number = 0;
			
			//The right bit shift operator (>>) shifts the bit value (binary number value) of the given addition by 1 (hence, >> 1)
			//this essentially halves the number. Consider an example of the number 256, hence its binary value is
			// 11111111. When we apply right bit shift to it the rightmost 1 gets removed, and a 0 is added at the leftmost position
			// this makes the number become 011111111. This is decimal form is nothing but 128. Hnce we are halving the number. For
			// an odd number, it acts like a half+Math.floor() function. Hence, consider the example of the number 15 whose binary
			// value is 00001111. When a rightmost bit shift is applied, its value become 00000111, which is 7, which is nothing but
			// half of 15 (7.5) and a math.floor function applied to it. This rightshift is used since it occupies less memory
			// and hence only one operation is done at bit level rather than divide by 2 then calling a flooring function.
			averageObjectsWidth = objectOneHitWidth + objectTwoHitWidth >> 1;
			averageObjectsHeight = objectOneHitHeight + objectTwoHitHeight >> 1;
			
			//here the x and y co-ord are substracted inorder to get an average x and y distance point.
			objectXSubstraction = objectOneX - objectTwoX;
			objectYSubstraction = objectOneY - objectTwoY;
			
			//here if the above result is negative, it is converted to positive.
			// the below statement (before the questionmark) asks whether X value is negative or not??
			// if so (after questionmark) then do operation in first bracket (that is multiply with negative to make positive)
			// if not, then do operation in second bracket (leave the value as it is)
			convertXSubstractionToPositive = objectXSubstraction < 0 ? ( -objectXSubstraction):(objectXSubstraction);
			convertYSubstractionToPositive = objectYSubstraction < 0 ? ( -objectYSubstraction):(objectYSubstraction);
			
			//check whether the the new X and Y from the substraction is inside the new average from hitHeight and hitWidth
			// if so, then return true, which means there is collision, else return flase which means there is no collision.
			if (convertXSubstractionToPositive < averageObjectsWidth && convertYSubstractionToPositive < averageObjectsHeight)
			{
				return true;
			}
			
			return false;
			
		}//end function collisionDetectionMathMechanic
		
		public function circleCollisionDetectionMathMechanic(objectOneCenterX:int, objectOneCenterY:int, objectTwoCenterX:int, objectTwoCenterY:int, objectOneHitWidth:uint, objectTwoHitWidth:uint) : Boolean
        {
			// Basic circle intersection formula states that if the distance between the centers of the circles is
			// less than the sum of hte square of the radii of the two circles, then the circles intersect each other.
			// here, inorder to get radii of the circles, we do half of the hitBox width (TODO:Diagram)
			// of both the objects. Hence we get the radii. Then we compare it with the distance square of the centers
			// of both the objects. If this distance is less, we return true, that is both the circles intersect each other.
			// else we return false, that is both the circles are not intersecting each other.
            if (pointDistanceSquare(objectOneCenterX, objectOneCenterY, objectTwoCenterX, objectTwoCenterY) <= Math.pow(objectOneHitWidth + objectTwoHitWidth >> 1, 2))
            {
                return true;
            }
            return false;
        }// end function circle
		
		private function projectedPoint(pointOneX:int, pointOneY:int, pointTwoX:int, pointTwoY:int, pointThreeX:int, pointThreeY:int)
		{
			// I dont completely understand the the mathematics part of this function, however, it does what it does and does what
			// the name says, that is, creates a projection point which is used for further calculations in the segmentDistance
			// function, which basically calculates the distance of the segment (This segmentDistance is then used only once
			// later). The function is priviate, as it is not used anywhere outside teh class and is used only in segment distance.
			// first off, it creates three points. Then creates a temporary point which is substraction of P3 and P2. Then it applies
			// square root to the squares of both x and y of the new temporary point which is formed by substraction of P3 and P2,
			// and divides the x and y of temporary point formed by substraction of P3 and P2 to get new x and y co ordinates
			// of this temporary point (we will call this point T32). Then it creates another temporary point with Substraction P1
			// and P2 (we will call this T12) we then multiply both x and y co ordinates of T12 and T32 and add them and store
			// this in say temp variable called TEMP. The final projected point will then equal to T32's x multiplied by 
			// TEMP and added to P2's x, similar operations are then performed on the Y axis, and we get the projected point.
			
			var firstPoint:Point = null;
			var secondPoint:Point = null;
			var thirdPoint:Point = null;
			var newTemporaryPointFromThreeAndTwo:Point = null;
			var newTemporaryPointFromThreeAndTwoDistanceFormula:Number = NaN;
			var newTemporaryPointFromOneAndTwo:Point = null;
			var tempPointsMultAndAdd:Number = null;
			var projectedFinalPoint:Point = null;
			
			firstPoint = new Point(pointOneX, pointOneY);
			secondPoint = new Point(pointTwoX, pointTwoY);
			thirdPoint = new Point(pointThreeX, pointThreeY);
			
			newTemporaryPointFromThreeAndTwo = new Point(pointThreeX - pointTwoX, pointThreeY - pointTwoY);
			newTemporaryPointFromThreeAndTwoDistanceFormula = Math.sqrt(newTemporaryPointFromThreeAndTwo.x * newTemporaryPointFromThreeAndTwo.x + newTemporaryPointFromThreeAndTwo.y * newTemporaryPointFromThreeAndTwo.y);
			
			newTemporaryPointFromThreeAndTwo.x = newTemporaryPointFromThreeAndTwo.x / newTemporaryPointFromThreeAndTwoDistanceFormula;
			newTemporaryPointFromThreeAndTwo.y = newTemporaryPointFromThreeAndTwo.y / newTemporaryPointFromThreeAndTwoDistanceFormula;
			
			newTemporaryPointFromOneAndTwo = new Point(pointOneX - pointTwoX, pointOneY - pointTwoY);
			tempPointsMultAndAdd = newTemporaryPointFromOneAndTwo.x * newTemporaryPointFromThreeAndTwo.x + newTemporaryPointFromOneAndTwo.y + newTemporaryPointFromThreeAndTwo.y;
			
			projectedFinalPoint = new Point(newTemporaryPointFromThreeAndTwo.x * tempPointsMultAndAdd + secondPoint.x , newTemporaryPointFromThreeAndTwo.y * tempPointsMultAndAdd + secondPoint.y);
			return projectedFinalPoint;
			
		}//end function projectedPoint
		
		private function isAbove(pointOneX:Number, pointOneY:Number, pointTwoX:int, pointTwoY:int, pointThreeX:int, pointThreeY:int) : Boolean
		{
			// This function goes in tandem with the above projectedPoint function. Both are private functions and are used only 
			// once in segmentDistance function (which is also used only once). Dont fully understand how this formula actually
			// relates to checking of a point whether it is above or below two certain points (as i have tried tracing the same
			// function, and always returned a flase, no matter if the point was above or below, however seems to work in tandem
			// with the above function which i havent understood completely, but still gets the job done imho, not ot focus much on
			// these functions as they are used only once throught the entire game)
			// In its essence, all this function does is adds the distance squares of P1P2 and P1P3 and checks if it is less than or
			// equal to distance square of P2P3. If it is it returns true, which means essentially the point is "above" else returns
			// false, which means essentially the point is "below" (what?)
			
			return pointDistanceSquare(pointOneX, pointOneY, pointTwoX, pointTwoX) + pointDistanceSquare(pointOneX, pointOneY, pointThreeX, pointThreeY) <= pointDistanceSquare(pointTwoX, pointTwoY, pointThreeX, pointThreeY);
			
		}//end function isAbove
		
		private function fixAngle(angleToFix:Number) : Number
		{
			// This function, as the name says, fixes the angle. "Fixing" the angle menas by bringing it into calculatory range.
			// By this, it means that if the angle is greater than 360 degrees, it substracts 360 degrees from the angle.
			// (one may question 360 means.. a circle, then how come something can be greater than 360?... answer: a rotation two 
			// times around the circumference of a circle by any object will mean that it has eseentially traveled or rotated
			// 720 degrees, upon which one circular rotation needs to be eradicated, as it redundantly overlaps.
			// hence if an object has moved, say one and a half circles, then its rotation is 540 degrees, out of which we remove 360
			// degrees, which was causing the overlap, and focus on only the 180 degrees relevant)
			// Also, if hte angle is less than 0 (that is if the object rotates anti-clockwise) it adds 360 to it to bring it into
			// the positive dominion inorder to perform calculations on it.
			// So essentially, this function checks if the angle is greater than 2PI (360 degrees) if so then it substracts 2PI
			// from it. also it checks if the angle is less than 0. If so, then it adds 2PI to it to make it a positive
			// angle needed for further calculations. We do not use an If-else block here, instead opt for a while loop.
			// because an object can rotate say 15-20 times around a circle, the while loop constantly keeps on bringing it down till
			// it is less than 360. the if statement will require extra calls and checks all the time whenever a change happens to 
			// the angle.
			
			while (angleToFix > 2 * Math.PI)
			{
				angleToFix = angleToFix - 2 * Math.PI;
			}
			
			while (angleToFix < 0)
			{
				angleToFix = angleToFix + 2 * Math.PI;
			}
			
			return angleToFix;
			
		}//end function fixAngle
		
		public function rotateToAngle(angle:Number, angleBetweenPointsPlusOffset:Number, turnSpeedIntoTimeDifference) : Number
		{
			//TODO: Write breifup
			
			
			
		}
		
		
		
		
	}
}