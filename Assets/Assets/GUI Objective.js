#pragma strict

var objectiveText = "Objective: None";
var objectiveComplete : boolean = false;

function Start () {

	SetNormalColor();
	
	var newObjective = RandomObjective();
	
	objectiveText = "Objective: " + newObjective;
	
	guiText.text = objectiveText;
}

function Update () {

	var distanceText = GameObject.Find("DistanceText").guiText.text.Substring(0, GameObject.Find("DistanceText").guiText.text.Length -1);;
	var distance : int = parseInt(distanceText);
	
	var bulletSpeed = GameObject.Find("Bullet(Clone)").rigidbody.velocity.magnitude;				
	
	if (bulletSpeed <= 0 && objectiveComplete) {
		GameObject.Find("ObjectiveComplete").guiText.text = "Objective Complete!";
	}
	else {
		GameObject.Find("ObjectiveComplete").guiText.text = "";
	}
	
	if (distance > 100) {
		SetVictoryColor();
		objectiveComplete = true;
	}
	else {
		SetNormalColor();
		objectiveComplete = false;
	}
	
	guiText.text = objectiveText;
}

function RandomObjective() {
	
	// Shoot over
	// Shoot under
	// Shoot within
	
	return "Shoot over 100m";
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