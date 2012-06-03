#pragma strict

var startStyle : GUIStyle;
var textStyle : GUIStyle;

function Start () {

}

function Update () {

}

function OnGUI () {


    if (GUI.Button (Rect (Screen.width/9,Screen.height/2 + Screen.height/5,Screen.width/5,Screen.width/5), "", startStyle)) {
    	Application.LoadLevel("Scene");
    }
    
    GUI.Label (Rect(10, 10, Screen.width - 10, 110), "1. Tap the screen to fire the cannon\nand meet the objective.", textStyle);
	GUI.Label (Rect(10, 130, Screen.width - 10, 60), "2. Pause the game to change gravity.", textStyle);
    GUI.Label (Rect(10, 190, Screen.width - 10, 60), "3. Try and meet all of the objectives.", textStyle);
}