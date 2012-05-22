#pragma strict

class Objective {

	// objectiveType 
	// 0 = Max Distance
	// 1 = Max Height
	// 2 = Between Distance
	// 3 = Between Height
	
	function init() {
		objectiveType = 0;
		objectiveText = "No Objective";
		par1 = 0;
		par2 = 0;
		par3 = 0;
	}
	
	var objectiveType : int;
	var objectiveText : String;
	var par1 : int;
	var par2 : int;
	var par3 : int;
};

var objectiveText = "Objective: None";
var objectiveComplete : boolean = false;
var currentObjective : int = 0;
var objectiveArray = new Objective[10];

function Start () {
	
	
	//objectiveArray.length = 10;

	objectiveArray.Initialize();
	objectiveArray[1] = new Objective();
	
	objectiveArray[1].objectiveType = 0;
	objectiveArray[1].objectiveText = "Shoot at least 100m";
	objectiveArray[1].par1 = 100;
	objectiveArray[1].par2 = 0;
	objectiveArray[1].par3 = 0;
	

	Debug.LogError(objectiveArray[1]);
		
	SetNormalColor();
			
	objectiveText = "Objective: " + objectiveArray[1].objectiveText;
	
	guiText.text = objectiveText;
	//currentObjective = PlayerPrefs.GetInt("Objective");
}

function Update () {
	
	// TODO:
	// Make an array of objectives
	
	var distanceText = GameObject.Find("DistanceText").guiText.text.Substring(0, GameObject.Find("DistanceText").guiText.text.Length -1);;
	var distance : int = parseInt(distanceText);
	
	var bulletSpeed = GameObject.Find("Bullet(Clone)").rigidbody.velocity.magnitude;				
	
	if (bulletSpeed <= 0 && objectiveComplete) {
		GameObject.Find("ObjectiveComplete").guiText.text = "Objective Complete!";
	}
	else {
		GameObject.Find("ObjectiveComplete").guiText.text = "";
	}
	
	// Specific for this objective
	if (distance > objectiveArray[0].par1) {
		SetVictoryColor();
		objectiveComplete = true;
	}
	else {
		SetNormalColor();
		objectiveComplete = false;
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