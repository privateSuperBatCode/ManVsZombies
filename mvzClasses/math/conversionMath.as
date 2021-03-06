package mvzClasses.math
{
	
	public class conversionMath extends Object
	{
		
		private var numSymbols:Array;
		private var symbols:String;
		
		public function conversionMath()
		{
			numSymbols = new Array("§", "[", "\"", "+", "!", "%", "/", "=", "(", ")", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
			symbols = "§[\"+!%/=()abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			return;
		}//end function conversionMath
		
		
		public function codeToNumber(stringToConvert:String) : uint
		{
			var convertedFinalNumber:uint = 0;
			var iterator:uint = 0;
			
			for (iterator = 0; iterator < stringToConvert.length; iterator++)
			{
				convertedFinalNumber = convertedFinalNumber + symbols.indexOf(stringToConvert.charAt(iterator)) * Math.pow(60, (stringToConvert - 1) - iterator);
				
			}
			return convertedFinalNumber;
		}//end function codeToNumber
		
		private function numberToCode(numberToConvert:int) : String
		{
			var booleanFlag:Boolean = false;
			var powerStorageVariable:int = 0;
			var divisionStorageVariable:Number = NaN;
			var flooringVariable:int = 0;
			var finalString:String = null;
			var iterator:int = 0;
			
			numberToConvert = Math.abs(numberToConvert);
			
			if (numberToConvert == 0)
			{
				return "0";
			}
			
			while (iterator >= 0)
			{
				powerStorageVariable = Math.pow(60, iterator);
				divisionStorageVariable = numberToConvert / powerStorageVariable;
				flooringVariable = Math.floor(divisionStorageVariable);
				
				if (flooringVariable > 0 || booleanFlag)
				{
					booleanFlag = true;
					finalString = finalString + numSymbols[flooringVariable];
					numberToConvert = numberToConvert - flooringVariable * powerStorageVariable
				}
				iterator = iterator - 1;
				
			}
			return finalString;
		}//end function numberToCode
		
		public function addTo(oldScore:String, newScore:uint) : String
		{
			newScore = newScore + uint(codeToNumber(oldScore));
			return numberToCode(newScore);
		}//end function numberToCode
		
	}
	
	
}