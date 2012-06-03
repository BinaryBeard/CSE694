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
var objectiveArray = new Objective[10];
var nextObjective : boolean = true;
var objectiveAttempted : boolean = false;

function Start () {
	
	objectiveArray.Initialize();
	objectiveArray[0] = new Objective(0, "Shoot at least 100m", 100, 0, 0);
	objectiveArray[1] = new Objective(0, "Shoot at least 200m", 200, 0, 0);
	objectiveArray[2] = new Objective(0, "Shoot at least 300m", 300, 0, 0);
	objectiveArray[3] = new Objective(0, "Shoot at least 400m", 400, 0, 0);
	objectiveArray[4] = new Objective(0, "Shoot at least 500m", 500, 0, 0);
	objectiveArray[5] = new Objective(0, "Shoot at least 600m", 600, 0, 0);
	objectiveArray[6] = new Objective(2, "Shoot between 100m annd 400m", 100, 400, 0);
	objectiveArray[7] = new Objective(2, "Shoot between 150m annd 300m", 150, 300, 0);
	objectiveArray[8] = new Objective(2, "Shoot between 200m annd 250m", 200, 250, 0);
	objectiveArray[9] = new Objective(2, "Shoot between 50m annd 100m", 50, 100, 0);


	Debug.Log(objectiveArray[0].objectiveText);
	Debug.Log(objectiveArray[1].objectiveText);
	Debug.Log(objectiveArray[2].objectiveText);
	Debug.Log(objectiveArray[3].objectiveText);
	Debug.Log(objectiveArray[4].objectiveText);
	Debug.Log(objectiveArray[5].objectiveText);
	Debug.Log(objectiveArray[6].objectiveText);
	Debug.Log(objectiveArray[7].objectiveText);
	Debug.Log(objectiveArray[8].objectiveText);
	Debug.Log(objectiveArray[9].objectiveText);

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
			
	objectiveText = "Objective: " + objectiveArray[currentObjective].objectiveText;
	
	guiText.text = objectiveText;
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
		
		GameObject.Find("NextButton").guiTexture.enabled = false;
		GameObject.Find("QuitButton").guiTexture.enabled = false;
		GameObject.Find("RetryButton").guiTexture.enabled = false;
		
		objectiveAttempted = true;
		
		// Objective Not Complete
		GameObject.Find("ObjectiveComplete").guiText.text = "";
		
		// Test for different Objectives
		if (objectiveArray[currentObjective].objectiveType == 0) {
	
			Debug.Log("Max Distance Objective");
		
			if (distance > objectiveArray[currentObjective].par1) {
		
				SetVictoryColor();
				objectiveComplete = true;
			}
			else {
		
				SetNormalColor();
				objectiveComplete = false;
				Debug.Log("Complete: False");
			}	
		}
		else if (objectiveArray[currentObjective].objectiveType == 1) {
	
			Debug.Log("Max Height Objective");
		}
		else if (objectiveArray[currentObjective].objectiveType == 2) {
	
			Debug.Log("Between Distance Objective");
			
			if (distance > objectiveArray[currentObjective].par1 && distance < objectiveArray[currentObjective].par2) {
		
				SetVictoryColor();
				objectiveComplete = true;
			}
			else {
		
				SetNormalColor();
				objectiveComplete = false;
				Debug.Log("Complete: False");
			}	
		}
		else if (objectiveArray[currentObjective].objectiveType == 3) {
	
			Debug.Log("Between Height Objective");
		}		
	}
	else {
		
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