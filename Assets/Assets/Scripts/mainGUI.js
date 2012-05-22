#pragma strict

var myStyle : GUIStyle;

function Start () {

}

function Update () {

}

function OnGUI () {

    if (GUI.Button (Rect (Screen.width/16,Screen.height/2 - Screen.height/4,Screen.width/4,Screen.height/4), "Start Game")) {    
        Application.LoadLevel("Scene");
    }
    if (GUI.Button (Rect (Screen.width/16,Screen.height/2 + 20,Screen.width/4,Screen.height/4), "How To Play")) {
    	Application.LoadLevel("HowTo");
    }
}