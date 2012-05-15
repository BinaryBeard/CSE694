#pragma strict

function Start () {

}

function Update () {

}

function OnGUI () {
    if (GUI.Button (Rect (Screen.width/2 - 100,Screen.height/2 - 150,200,100), "Start Game")) {
        Application.LoadLevel("Scene");
    }
    if (GUI.Button (Rect (Screen.width/2 - 100,Screen.height/2,200,100), "How To Play")) {
    	Application.LoadLevel("HowTo");
    }
}