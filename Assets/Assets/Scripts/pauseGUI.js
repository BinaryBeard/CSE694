#pragma strict

class Planet {

	var gravityEffect : float = 0;
	var planetName : String = "";
	var shootForce : int = 0;

	function Planet(grav : float, name : String, force : int) {

		gravityEffect = grav;
		planetName = name;
		shootForce = force;
	}
};


var resumeStyle : GUIStyle;
var prevStyle : GUIStyle;
var nextStyle : GUIStyle;
var planetStyle : GUIStyle;
var quitStyle : GUIStyle;
var gravityStyle : GUIStyle;

var planetArray = new Planet[10];
var currentPlanet = 0;

function Start () {

	planetArray[0] = new Planet(1.0, "Earth", 4000);
	planetArray[1] = new Planet(0.3, "Mercury", 4000);
	planetArray[2] = new Planet(0.9, "Venus", 4000);
	planetArray[3] = new Planet(0.7, "Undiscovered", 4000);
	planetArray[4] = new Planet(0.3, "Mars", 4000);
	planetArray[5] = new Planet(2.3, "Jupiter", 4000);
	planetArray[6] = new Planet(1.0, "Saturn", 4000);
	planetArray[7] = new Planet(0.8, "Uranus", 4000);
	planetArray[8] = new Planet(1.1, "Neptune", 4000);
	planetArray[9] = new Planet(0.6, "Undiscovered", 4000);

}

function Update () {

    if (GameObject.Find("Canon_System")) {
    
    	Debug.Log("System Found");
    }
}

function OnGUI() {

    if (GUI.Button (Rect (Screen.width/45,Screen.height - Screen.height/4,Screen.width/5,Screen.width/5), "", resumeStyle)) {
    	Application.LoadLevel("Scene");
    	
    	GameObject.Find("Cannon_System").GetComponent(cannon).stopped = false;
    }
    
	if (GUI.Button (Rect (Screen.width - Screen.width/4.5,Screen.height/2.5,Screen.width/5,Screen.width/5), "", nextStyle)) {

       	// Take gravity to next level
       	if (currentPlanet < planetArray.Length - 1) {
       		
       		currentPlanet++;
       	}
    }
    
    if (GUI.Button (Rect (Screen.width - Screen.width/4.5,Screen.height - Screen.height/4,Screen.width/5,Screen.width/5), "", quitStyle)) {
    	Application.LoadLevel("MainMenu");
    }
    
    if (GUI.Button (Rect (Screen.width/45,Screen.height/2.5,Screen.width/5,Screen.width/5), "", prevStyle)) {

       	// Take gravity to previous level
       	if (currentPlanet > 0) {
       		
       		currentPlanet--;
       	}
    }
    
	GUI.Label (Rect(Screen.width/2 - 400, Screen.height/2 - 100, 800, 200), planetArray[currentPlanet].planetName, planetStyle);
	GUI.Label (Rect(0, 10, Screen.width, 300), planetArray[currentPlanet].gravityEffect.ToString() + "x\n Earth's gravity", gravityStyle);

	GameObject.Find("Cannon_System").GetComponent(cannon).gravityEffect = planetArray[currentPlanet].gravityEffect;
	GameObject.Find("Cannon_System").GetComponent(cannon).shootForce = planetArray[currentPlanet].shootForce;
}