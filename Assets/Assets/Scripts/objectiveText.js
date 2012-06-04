#pragma strict

class Objective {

	var objectiveType : int = 0;
	var objectiveText : String = "";
	var par1 : int = 0;
	var par2 : int = 0;
	var par3 : int = 0;

	// objectiveType 
	// 0 = Max Distance
	// 1 = Max Height
	// 2 = Between Distance
	// 3 = Between Height
	
	function Objective(type : int, text : String, p1 : int, p2 : int, p3 : int) {
		objectiveType = type;
		objectiveText = text;
		par1 = p1;
		par2 = p2;
		par3 = p3;
	}
};

var objectiveText = "Objective: None";
var objectiveComplete : boolean = false;
var currentObjective : int = 0;
var objectiveArray = new Array();
var nextObjective : boolean = true;
var objectiveAttempted : boolean = false;

function Start () {
		
	//objectiveArray.Initialize();
	
	objectiveArray[0] = new Objective(0, "Shoot at least 50m", 50, 0, 0);
	objectiveArray[1] = new Objective(2, "Shoot between 50m annd 100m", 50, 100, 0);
	objectiveArray[2] = new Objective(2, "Shoot between 150m annd 350m", 150, 350, 0);

	objectiveArray[3] = new Objective(0, "Shoot at least 100m", 100, 0, 0);
	objectiveArray[4] = new Objective(2, "Shoot between 200m annd 300m", 200, 300, 0);
	objectiveArray[5] = new Objective(2, "Shoot between 200m annd 400m", 200, 400, 0);
	objectiveArray[6] = new Objective(2, "Shoot between 400m annd 450m", 400, 450, 0);

	objectiveArray[7] = new Objective(0, "Shoot at least 150m", 150, 0, 0);
	objectiveArray[8] = new Objective(2, "Shoot between 150m annd 200m", 150, 200, 0);
	objectiveArray[9] = new Objective(2, "Shoot between 400m annd 600m", 400, 600, 0);
	objectiveArray[10] = new Objective(0, "Shoot at least 200m", 200, 0, 0);
	/*objectiveArray[11] = new Objective(2, "Shoot between 50m annd 200m", 50, 200, 0);

	objectiveArray[12] = new Objective(0, "Shoot at least 250m", 250, 0, 0);
	objectiveArray[13] = new Objective(2, "Shoot between 400m annd 550m", 400, 550, 0);
	objectiveArray[14] = new Objective(2, "Shoot between 300m annd 400m", 300, 400, 0);

	objectiveArray[15] = new Objective(0, "Shoot at least 300m", 300, 0, 0);
	objectiveArray[16] = new Objective(2, "Shoot between 50m annd 150m", 50, 150, 0);
	objectiveArray[17] = new Objective(2, "Shoot between 350m annd 500m", 350, 500, 0);

	objectiveArray[18] = new Objective(0, "Shoot at least 350m", 350, 0, 0);
	objectiveArray[19] = new Objective(2, "Shoot between 100m annd 200m", 100, 200, 0);
	objectiveArray[20] = new Objective(2, "Shoot between 350m annd 550m", 350, 550, 0);

	objectiveArray[21] = new Objective(0, "Shoot at least 400m", 400, 0, 0);
	objectiveArray[22] = new Objective(2, "Shoot between 100m annd 150m", 100, 150, 0);
	objectiveArray[23] = new Objective(2, "Shoot between 250m annd 400m", 250, 400, 0);

	objectiveArray[24] = new Objective(0, "Shoot at least 450m", 450, 0, 0);
	objectiveArray[25] = new Objective(2, "Shoot between 50m annd 250m", 50, 250, 0);
	objectiveArray[26] = new Objective(2, "Shoot between 100m annd 250m", 100, 250, 0);
	objectiveArray[27] = new Objective(2, "Shoot between 200m annd 350m", 200, 350, 0);

	objectiveArray[28] = new Objective(0, "Shoot at least 500m", 500, 0, 0);
	objectiveArray[29] = new Objective(2, "Shoot between 150m annd 300m", 150, 300, 0);
	objectiveArray[30] = new Objective(2, "Shoot between 400m annd 500m", 400, 500, 0);
	objectiveArray[31] = new Objective(2, "Shoot between 350m annd 400m", 350, 400, 0);

	objectiveArray[32] = new Objective(0, "Shoot at least 550m", 550, 0, 0);
	objectiveArray[33] = new Objective(2, "Shoot between 100m annd 300m", 100, 300, 0);
	objectiveArray[34] = new Objective(2, "Shoot between 150m annd 250m", 150, 250, 0);

	objectiveArray[35] = new Objective(0, "Shoot at least 600m", 600, 0, 0);
	objectiveArray[36] = new Objective(2, "Shoot between 250m annd 450m", 250, 450, 0);
	objectiveArray[37] = new Objective(2, "Shoot between 200m annd 250m", 200, 250, 0);

	objectiveArray[38] = new Objective(0, "Shoot at least 650m", 650, 0, 0);
	objectiveArray[39] = new Objective(2, "Shoot between 300m annd 450m", 300, 450, 0);
	objectiveArray[40] = new Objective(2, "Shoot between 350m annd 450m", 350, 450, 0);
	objectiveArray[41] = new Objective(2, "Shoot between 250m annd 300m", 250, 300, 0);
	objectiveArray[42] = new Objective(2, "Shoot between 250m annd 350m", 250, 350, 0);

	objectiveArray[43] = new Objective(0, "Shoot at least 700m", 700, 0, 0);
	objectiveArray[44] = new Objective(2, "Shoot between 300m annd 500m", 300, 500, 0);
	objectiveArray[45] = new Objective(2, "Shoot between 300m annd 350m", 300, 350, 0);
*/
	if (!PlayerPrefs.HasKey("ObjectiveInt")) {
		
		Debug.Log("ObjectiveInt not there!");
		Debug.Log("Creating ObjectiveInt");
		
		
		PlayerPrefs.SetInt("ObjectiveInt", 0);
	}
	
	// Used for Debugging
	//PlayerPrefs.SetInt("ObjectiveInt", 0);

	
	Debug.Log(PlayerPrefs.GetInt("ObjectiveInt"));
	var currentObjective = PlayerPrefs.GetInt("ObjectiveInt");
	
	SetNormalColor();
			
	objectiveText = "Objective: " + (objectiveArray[currentObjective] as Objective).objectiveText;
	
	guiText.text = objectiveText;
	Debug.Log(objectiveText);
}

function Update () {
	
	var distanceText = GameObject.Find("DistanceText").guiText.text.Substring(0, GameObject.Find("DistanceText").guiText.text.Length -1);;
	var distance : int = parseInt(distanceText);
	var currentObjective = PlayerPrefs.GetInt("ObjectiveInt");

	if (GameObject.Find("Bullet(Clone)")) {
	
		var bulletSpeed = GameObject.Find("Bullet(Clone)").rigidbody.velocity.magnitude;				
	}
	
	if (bulletSpeed <= 0 && objectiveComplete) {
	
		// Objective Complete
		GameObject.Find("ObjectiveComplete").guiText.text = "Objective Complete!";
		guiText.text = "";
		
		GameObject.Find("NextButton").GetComponent(nextGame).enabled = true;
		GameObject.Find("QuitButton").GetComponent(quitGame).enabled = true;
		GameObject.Find("QuitButton").guiTexture.enabled = true;
		GameObject.Find("NextButton").guiTexture.enabled = true;


		// Go to the next objective
		if (nextObjective) {
		
			var newObjective = currentObjective + 1;
			PlayerPrefs.SetInt("ObjectiveInt", newObjective);
			Debug.Log("Next Objective: " + PlayerPrefs.GetInt("ObjectiveInt"));
			
			nextObjective = false;
		}
	}
	else if (bulletSpeed <= 0 && !objectiveComplete && objectiveAttempted) {
	
		// This means we failed
		Debug.Log("Objective Failed");
		
		GameObject.Find("QuitButton").GetComponent(quitGame).enabled = true;
		GameObject.Find("RetryButton").GetComponent(retryGame).enabled = true;
		GameObject.Find("QuitButton").guiTexture.enabled = true;
		GameObject.Find("RetryButton").guiTexture.enabled = true;
		
		SetFailureColor();
		GameObject.Find("ObjectiveComplete").guiText.text = "Objective Failed";
		GameObject.Find("ObjectiveComplete").guiText.font.material.color.r = 1.000;
		GameObject.Find("ObjectiveComplete").guiText.font.material.color.g = 0.219;
		GameObject.Find("ObjectiveComplete").guiText.font.material.color.b = 0.247;
		GameObject.Find("ObjectiveComplete").guiText.font.material.color.a = 1.000;
	}
	else if (bulletSpeed >= 1) {
		
		GameObject.Find("NextButton").GetComponent(nextGame).enabled = false;
		GameObject.Find("QuitButton").GetComponent(quitGame).enabled = false;
		GameObject.Find("RetryButton").GetComponent(retryGame).enabled = false;
		GameObject.Find("NextButton").guiTexture.enabled = false;
		GameObject.Find("QuitButton").guiTexture.enabled = false;
		GameObject.Find("RetryButton").guiTexture.enabled = false;
		
		objectiveAttempted = true;
		
		// Objective Not Complete
		GameObject.Find("ObjectiveComplete").guiText.text = "";
		
		// Test for different Objectives
		if ((objectiveArray[currentObjective] as Objective).objectiveType == 0) {
	
			Debug.Log("Max Distance Objective");
		
			if (distance > (objectiveArray[currentObjective] as Objective).par1) {
		
				SetVictoryColor();
				objectiveComplete = true;
			}
			else {
		
				SetNormalColor();
				objectiveComplete = false;
				Debug.Log("Complete: False");
			}	
		}
		else if ((objectiveArray[currentObjective] as Objective).objectiveType== 1) {
	
			Debug.Log("Max Height Objective");
		}
		else if ((objectiveArray[currentObjective] as Objective).objectiveType == 2) {
	
			Debug.Log("Between Distance Objective");
			
			if (distance > (objectiveArray[currentObjective] as Objective).par1 && distance < (objectiveArray[currentObjective] as Objective).par2) {
		
				SetVictoryColor();
				objectiveComplete = true;
			}
			else {
		
				SetNormalColor();
				objectiveComplete = false;
				Debug.Log("Complete: False");
			}	
		}
		else if ((objectiveArray[currentObjective] as Objective).objectiveType == 3) {
	
			Debug.Log("Between Height Objective");
		}		
	}
	else {
	
		GameObject.Find("NextButton").GetComponent(nextGame).enabled = false;
		GameObject.Find("QuitButton").GetComponent(quitGame).enabled = false;
		GameObject.Find("RetryButton").GetComponent(retryGame).enabled = false;
		GameObject.Find("NextButton").guiTexture.enabled = false;
		GameObject.Find("QuitButton").guiTexture.enabled = false;
		GameObject.Find("RetryButton").guiTexture.enabled = false;
	}
		
	guiText.text = objectiveText;
}

function SetNormalColor() {
	guiText.font.material.color.r = 0.682;
	guiText.font.material.color.g = 0.858;
	guiText.font.material.color.b = 1.000;
	guiText.font.material.color.a = 1.000;
}

function SetVictoryColor() {

	guiText.font.material.color.r = 0.219;
	guiText.font.material.color.g = 1.000;
	guiText.font.material.color.b = 0.247;
	guiText.font.material.color.a = 1.000;
}

function SetFailureColor() {

	guiText.font.material.color.r = 1.000;
	guiText.font.material.color.g = 0.219;
	guiText.font.material.color.b = 0.247;
	guiText.font.material.color.a = 1.000;
}